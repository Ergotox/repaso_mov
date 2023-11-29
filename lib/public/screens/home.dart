import 'package:flutter/material.dart';
import 'package:repaso_mov/character_hub/models/character.dart';

import '../../character_hub/screens/charactercard.dart';
import '../../character_hub/services/service.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Service characterService = Service();
  List<Character>? characters;

  @override
  void initState() {
    super.initState();
    _loadCharacters();
  }

  Future<void> _loadCharacters() async {
    List<Character>? loadedCharacters;

    try {
      loadedCharacters = await characterService.getAll();
    } catch (e) {
      // Handle any potential errors
      print('Error loading characters: $e');
    }

    if (mounted) {
      setState(() {
        characters = loadedCharacters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        key: UniqueKey(),
        children: [
          Text(
            "Search results (${characters?.length ?? 0}):",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          if (characters != null)
            ...characters!.map(
              (character) => CharacterCard(character: character),
            ).toList(),
        ],
      ),
    );
  }
}