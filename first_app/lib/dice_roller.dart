import 'package:flutter/material.dart';
import 'dart:math';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var activeDiceImage = 'assests/images/dice-1.png'; // Corrected path

  void rollDice() {
    var diceRoll = Random().nextInt(6) + 1;
    setState(() {
      // Randomize the dice image
      activeDiceImage = 'assests/images/dice-$diceRoll.png'; // Randomize logic
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          activeDiceImage,
          width: 200,
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 26),
          ),
          child: const Text('Roll Dice'),
        ),
      ],
    );
  }
}
