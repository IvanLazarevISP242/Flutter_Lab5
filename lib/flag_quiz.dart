import 'dart:math';
import 'package:flutter/material.dart';
import 'styled_text.dart';

final randomizer = Random();

class FlagQuiz extends StatefulWidget {
  const FlagQuiz({super.key});

  @override
  State<FlagQuiz> createState() {
    return _FlagQuizState();
  }
}

class _FlagQuizState extends State<FlagQuiz> {
  var currentFlag = 1; 
  var score = 0;
  var resultText = 'Чей это флаг?';

  void checkAnswer(int chosenAnswer) {
    setState(() {
      if (chosenAnswer == currentFlag) {
        score = score + 1;
        resultText = 'Правильно!';
      } else {
        resultText = 'Неверно!';
      }
    });
  }

  void nextFlag() {
    setState(() {
      currentFlag = randomizer.nextInt(3) + 1; // Генерирует от 1 до 3
      resultText = 'Чей это флаг?';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        StyledText('Счёт: $score'),
        const SizedBox(height: 20),
        Image.asset(
          'assets/images/flag-$currentFlag.png',
          width: 300,
        ),
        const SizedBox(height: 20),
        StyledText(resultText),
        const SizedBox(height: 20),
        TextButton(
          onPressed: () => checkAnswer(1),
          style: TextButton.styleFrom(
            foregroundColor: Colors.lime,
            textStyle: const TextStyle(fontSize: 24),
          ),
          child: const Text('Вариант 1 (Россия)'),
        ),
        TextButton(
          onPressed: () => checkAnswer(2),
          style: TextButton.styleFrom(
            foregroundColor: Colors.lime,
            textStyle: const TextStyle(fontSize: 24),
          ),
          child: const Text('Вариант 2 (Франция)'),
        ),
        TextButton(
          onPressed: () => checkAnswer(3),
          style: TextButton.styleFrom(
            foregroundColor: Colors.lime,
            textStyle: const TextStyle(fontSize: 24),
          ),
          child: const Text('Вариант 3 (Сербия)'),
        ),
        const SizedBox(height: 30),
        TextButton(
          onPressed: nextFlag,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 20),
          ),
          child: const Text('Следующий флаг ->'),
        ),
      ],
    );
  }
}
