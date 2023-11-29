import 'package:flutter/material.dart';
import 'package:repaso_mov/character_hub/models/character.dart';
import 'package:repaso_mov/character_hub/screens/character_container.dart';
import 'package:repaso_mov/character_hub/services/service.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchTermController = TextEditingController();
  Service characterService = Service();
  List<Character>? _characters;
  bool isSearching = false;

  void onSearch(String name) async {
    setState(() {
      isSearching = true;
    });
    _characters = await characterService.getByName(name);
    setState(() {
      _characters = _characters;
      isSearching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: searchTermController,
            decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Search a character",
            prefixIcon: Icon(Icons.search),
          ),
          onSubmitted: onSearch,
          ),
        ),
        Expanded(
          child: 
              CharacterContainer(characters: _characters),
        )
      ],
    );
  }

  @override
  void dispose() {
    searchTermController.dispose();
    super.dispose();
  }
}