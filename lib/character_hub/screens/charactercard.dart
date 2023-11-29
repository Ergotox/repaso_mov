import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:repaso_mov/character_hub/models/character.dart';
import 'package:repaso_mov/character_hub/persistence/repositories/character_repository.dart';

import 'character_detail.dart';

class CharacterCard extends StatefulWidget {
  final Character character;
  const CharacterCard({super.key, required this.character});

  @override
  State<CharacterCard> createState() => _CharacterCardState();
}

class _CharacterCardState extends State<CharacterCard> {
  //Crear un repositorio de personajes
  CharacterRepository characterRepository = CharacterRepository();
  //Crear un personaje
  late Character character;
  //Crear una variable para saber si es favorito o no
  bool isFavorite = false;

  //Inicializar el estado
  @override
  void initState(){
    character = widget.character;
    initialize();
    super.initState();
  }
  //Inicializar la variable isFavorite
  void initialize() async {
    isFavorite = await characterRepository.existById(character.id);
    if (mounted) {
      setState(
        () {
          isFavorite = isFavorite;
        }
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final characterImage = Image.network(character.image);

    void handleFavorite() async {
      if (isFavorite) {
        await characterRepository.delete(character);
      } else {
        await characterRepository.insert(character);
      }
      if (mounted) {
        setState(
          () {
            isFavorite = !isFavorite;
          }
        );
      }
    }

    //Agregar despues de crear Characterdetail
    void handleTapOnCard() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CharacterDetail(character: character)
          )
      );
    }


    return GestureDetector(
      onTap: handleTapOnCard,
      child: Card(
        child: ListTile(
          leading: characterImage,
          title: Text(character.name),
          subtitle: Text(character.species),
          trailing: IconButton(
            onPressed: handleFavorite,
            icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border
            ),
          ),
        ),
      ),
    );
  }
}