import 'package:flutter/material.dart';

import '../models/character.dart';
import '../persistence/repositories/character_repository.dart';
import 'charactercard.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  CharacterRepository characterRepository = CharacterRepository();
  List<Character> characters = [];

  @override
  initState() {
    initialize();
    super.initState();
  }

  initialize() async {
    final favoriteCharacters = await characterRepository.getAll() ?? [];

    if (mounted) {
      setState(() {
        characters = favoriteCharacters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //if (characters.isEmpty) {
    //  return const NoFavoriteCharactersMessage();
    //}

    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        key: UniqueKey(),
        children: [
          Text(
            "Favorite characters (${characters.length}):",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          ...characters.map(
                  (character) => CharacterCard(character: character)
          ).toList()
        ],
      ),
    );
  }
}