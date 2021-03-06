import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_stacked/constants.dart';
import 'package:app_stacked/controllers/question_controller.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'progress_bar.dart';
import 'question_card.dart';

class Body extends StatelessWidget {
  const Body({
     Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ceci aura accès au controleur
    QuestionController _questionController = Get.put(QuestionController());
    return Stack(
      children: [
        WebsafeSvg.asset("assets/icons/image1resize.svg", fit: BoxFit.fill),
        SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: ProgressBar(),
            ),
            SizedBox(height: kDefaultPadding),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Obx(
                () => Text.rich(
                  TextSpan(
                      text: "Question ${_questionController.questionNumber}",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(color: kSecondaryColor),
                      children: [
                        TextSpan(
                          text: "/${_questionController.questions.length}",
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              ?.copyWith(color: kSecondaryColor),
                        ),
                      ]),
                ),
              ),
            ),
            Divider(thickness: 3.5),
            SizedBox(height: kDefaultPadding),
            Expanded(
              child: PageView.builder(
                // on block le switch a une autre page
                physics: NeverScrollableScrollPhysics(),
                controller: _questionController.pageController,
                onPageChanged: _questionController.updateTheQuizNum,
                itemCount: _questionController.questions.length,
                itemBuilder: (context, index) => QuestionCard(
                  question: _questionController.questions[index],
                ),
              ),
            ),
          ],
        )),
      ],
    );
  }
}
