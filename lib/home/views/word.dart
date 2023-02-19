import 'package:flutter/material.dart';
import 'package:tusmo_flutter/home/views/letter.dart';

class Word extends StatelessWidget {
  const Word({
    super.key,
    required this.value,
    this.letterColor = Colors.deepOrange,
  });

  final String value;
  final Color letterColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...value
            .split('')
            .map(
              (e) => Letter(
                charracter: e,
                color: letterColor,
              ),
            )
            .toList(),
      ],
    );
  }
}
