import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'quizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Quiz App',
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  QuizBrain quiz = new QuizBrain();
  List<Icon> ocp = [];
  int _questionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Quizzler'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 6,
            child: Container(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    quiz.getBank(_questionIndex).getQuestion(),
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 20, 5, 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                child: Text(
                  'True',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  bool checkAnswer = quiz.getBank(_questionIndex).getAnswer();
                  if (checkAnswer == true) {
                    ocp.add(
                      Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    );
                  } else {
                    ocp.add(
                      Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                  }
                  setState(() {
                    if (_questionIndex == quiz.getLength() - 1) {
                      Alert(
                        context: context,
                        type: AlertType.info,
                        title: "Completed",
                        desc:
                            "You have completed the quiz I will reset it for you",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "COOL",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              setState(() {
                                _questionIndex = 0;
                                ocp.clear();
                                Navigator.pop(context);
                              });
                            },
                            color: Color.fromRGBO(0, 179, 134, 1.0),
                            radius: BorderRadius.circular(0.0),
                          ),
                        ],
                      ).show();
                    } else
                      _questionIndex++;
                  });
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                child: Text(
                  'False',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  bool checkAnswer = quiz.getBank(_questionIndex).getAnswer();
                  if (checkAnswer == false) {
                    ocp.add(
                      Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    );
                  } else {
                    ocp.add(
                      Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                  }
                  setState(() {
                    if (_questionIndex == quiz.getLength() - 1) {
                      Alert(
                        context: context,
                        type: AlertType.info,
                        title: "Completed",
                        desc:
                            "You have completed the quiz I will reset it for you",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "COOL",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              setState(() {
                                _questionIndex = 0;
                                ocp.clear();
                                Navigator.pop(context);
                              });
                            },
                            color: Color.fromRGBO(0, 179, 134, 1.0),
                            radius: BorderRadius.circular(0.0),
                          ),
                        ],
                      ).show();
                    } else {
                      _questionIndex++;
                    }
                  });
                },
              ),
            ),
          ),
          Row(
            children: ocp,
          ),
        ],
      ),
    );
  }
}
