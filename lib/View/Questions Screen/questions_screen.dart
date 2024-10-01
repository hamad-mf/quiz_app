import 'package:flutter/material.dart';
import 'package:quiz_app/Utils/Color_constants.dart';
import 'package:quiz_app/View/Result%20Screen/result_screen.dart';
import 'package:quiz_app/dummy_db.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int questionIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.mainblack,
      appBar: AppBar(
        backgroundColor: ColorConstants.mainblack,
        actions: [
          Text(
            "${questionIndex + 1}/${DummyDb.questionslist.length}",
            style: TextStyle(color: ColorConstants.mainwhite, fontSize: 15),
          ),
          SizedBox(
            width: 5,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 380,
              decoration: BoxDecoration(
                  color: ColorConstants.maingrey,
                  borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Text(
                  DummyDb.questionslist[questionIndex]["question"],
                  style: TextStyle(
                      color: ColorConstants.mainwhite,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Column(
              children: List.generate(
                4,
                (index) => Padding(
                  padding: const EdgeInsets.all(4),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    height: 50,
                    decoration: BoxDecoration(
                        color: ColorConstants.mainblack,
                        border: Border.all(
                            color: ColorConstants.mainwhite, width: 2),
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Padding(padding: EdgeInsets.all(12)),
                        Text(
                          DummyDb.questionslist[questionIndex]["option"][index],
                          style: TextStyle(
                              color: ColorConstants.mainwhite,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                        Icon(
                          Icons.circle_outlined,
                          color: ColorConstants.mainwhite,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (questionIndex < DummyDb.questionslist.length - 1) {
                    questionIndex = questionIndex + 1;
                  } else {
                    // Optionally, handle the end of the quiz here
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultScreen()));
                  }
                });
              },
              child: Container(
                height: 50,
                width: double.infinity,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    color: ColorConstants.buttonblue,
                    borderRadius: BorderRadius.circular(12)),
                child: Text(
                  "Next",
                  style:
                      TextStyle(color: ColorConstants.mainblack, fontSize: 17),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
