import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/Utils/Animation_constants.dart';
import 'package:quiz_app/View/Result%20Screen/result_screen.dart';
import 'package:quiz_app/dummy_db.dart';

class QuestionsScreen extends StatefulWidget {
  final String selectedCategory;

  const QuestionsScreen({super.key, required this.selectedCategory});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int questionIndex = 0;
  int? selectedAnswerIndex;
  double _currentValue = 10;
  int count = 1;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> questions =
        DummyDb.categoryQuestions[widget.selectedCategory]!;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.selectedCategory),
        backgroundColor: Colors.black,
        actions: [
          Text(
            "${questionIndex + 1} / ${questions.length}",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          children: [
            Container(
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.white)),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "$count/10",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                )),
            Expanded(
              child: Stack(children: [
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      questions[questionIndex]["question"],
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
                if (selectedAnswerIndex ==
                    questions[questionIndex]["answerIndex"])
                  Align(
                      alignment: Alignment.center,
                      child: Lottie.asset(
                          AnimationConstants.RIGHT_ANSWER_ANIMATION)),
              ]),
            ),
            Column(
              children: List.generate(
                questions[questionIndex]["options"].length,
                (optionIndex) {
                  var currentQuestion = questions[questionIndex];

                  return Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: InkWell(
                      onTap: () {
                        if (selectedAnswerIndex == null) {
                          selectedAnswerIndex = optionIndex;
                          setState(() {});
                          print(selectedAnswerIndex);
                        }
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: getColor(optionIndex),
                              width: 2,
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              currentQuestion["options"][optionIndex],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            Icon(
                              Icons.circle_outlined,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            if (selectedAnswerIndex != null)
              InkWell(
                onTap: () {
                  selectedAnswerIndex = null;
                  if (questionIndex < questions.length - 1) {
                    questionIndex++;
                    setState(() {});
                  } else {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultScreen(
                                  righanswercount: 4,
                                )));
                  }
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Text(
                    "Next",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }

  Color getColor(int currentOptinIndex) {
    List<Map<String, dynamic>> questions =
        DummyDb.categoryQuestions[widget.selectedCategory]!;

    if (selectedAnswerIndex != null &&
        currentOptinIndex == questions[questionIndex]["answerIndex"]) {
      return Colors.green;
    }

    if (selectedAnswerIndex == currentOptinIndex) {
      if (selectedAnswerIndex == questions[questionIndex]["answerIndex"]) {
        return Colors.green;
      } else {
        return Colors.red;
      }
    } else {
      return Colors.white;
    }
  }
}
