import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'じゃんけん'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ロボットの出す手を決定する
  String chooseHand() {
    List<String> hands = ["グー", "チョキ", "パー"];
    hands.shuffle(); // シャッフル
    String hand = hands.first;
    String result = "";

    if (hand == "グー") {
      result = "assets/janken_gu.png";
    } else if (hand == "チョキ") {
      result = "assets/janken_choki.png";
    } else {
      result = "assets/janken_pa.png";
    }

    return result;
  }

  // じゃんけん：ロボットの手を表示します
  void showRobotResult() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              "ロボットくん",
              style: TextStyle(fontSize: 20),
            ),
            content: Image.asset(chooseHand()),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("閉じる"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              showRobotResult();
            },
            child: const Text("じゃんけん"),
          ),
        ));
  }
}
