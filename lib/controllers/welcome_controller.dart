import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_stacked/screens/quiz/quiz_screen.dart';
import 'package:app_stacked/screens/welcome/welcome_screen.dart';

class WelcomeController extends GetxController
    with SingleGetTickerProviderMixin {
  TextEditingController _textFieldPseudo = new TextEditingController();
  TextEditingController get textFieldPseudo => this._textFieldPseudo;

  late String _textPseudo;
  String get textPseudo => this._textPseudo;

  void onTapCommencer() {
    _textPseudo = _textFieldPseudo.text;
    print(_textPseudo);
    if (_textPseudo != "") {
      Get.to(QuizScreen());
      _textFieldPseudo.clear();
    } else {
      Get.to(WelcomeScreen());
      _textFieldPseudo.clear();
    }
  }
}
