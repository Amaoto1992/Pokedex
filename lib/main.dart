import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/features/pokemon/presentation/pokedex/cubit/pokemon_cubit.dart';
import 'package:pokedex/features/pokemon/presentation/pokedex/pokedex_screen.dart';
import 'package:pokedex/injection_container.dart';

void main(){
  setUp();
  runApp(const Pokedex());
}

class Pokedex extends StatelessWidget {
  const Pokedex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      home: PokedexScreen(),
    );
  }
}
