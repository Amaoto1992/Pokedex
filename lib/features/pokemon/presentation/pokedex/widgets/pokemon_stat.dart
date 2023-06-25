import 'package:flutter/material.dart';

class PokemonStat extends StatelessWidget {
  const PokemonStat({
    Key? key,
    required this.statName,
    required this.value,
  }) : super(key: key);

  final String statName;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Text(
            textAlign: TextAlign.start,
            statName,
            style: const TextStyle(
              color: Colors.black45,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Text(
            textAlign: TextAlign.end,
            value,
            style: const TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
