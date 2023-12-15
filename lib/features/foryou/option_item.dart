import 'package:flutter/material.dart';

class OptionItemWidget extends StatelessWidget {
  // final bool isCorrectAnswer;
  // final bool isSelected;
  final String option;
  final String itemAnswer;
  final String? selectedAnswer;
  final String? correctAnswer;

  const OptionItemWidget({
    super.key,
    required this.option,
    required this.itemAnswer,
    this.selectedAnswer,
    this.correctAnswer,
  });

  //
  // const OptionItemWidget({
  //   super.key,
  //   required this.option,
  //   this.isCorrectAnswer = false,
  //   this.isSelected = false,
  // });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 40),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(8), color: _bgColor()),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(option,
                  style: const TextStyle(
                      fontSize: 17,
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          blurRadius: 1,
                          offset: Offset(1, 1.5),
                        )
                      ],
                      color: Colors.white)),
            ),
          ),
          if (correctAnswer != null) ...[
            correctAnswer == itemAnswer
                ? const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.thumb_up,
                      color: Colors.green,
                    ),
                  )
                : selectedAnswer == itemAnswer
                    ? const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.thumb_down,
                          color: Colors.redAccent,
                        ),
                      )
                    : SizedBox()
          ],
        ],
      ),
    );
  }

  Color _bgColor() {
    return (selectedAnswer != null
            ? correctAnswer == itemAnswer
                ? Colors.green
                : selectedAnswer == itemAnswer
                    ? Colors.red
                    : Colors.white
            : Colors.white)
        .withOpacity(0.5);
  }
}
