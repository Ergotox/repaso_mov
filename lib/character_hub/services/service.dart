import 'dart:convert';
import 'dart:io';

import 'package:repaso_mov/character_hub/models/character.dart';

//importamos la librería http
import 'package:http/http.dart' as http;

class Service {
  // Url base de la API
  final String baseUrl = 'https://rickandmortyapi.com/api';

  Future<List<Character>> getByName(String name) async{
    // Url de la API
    final http.Response response = await http.get(
      Uri.parse('$baseUrl/character/?name=$name')
    );

    // Si la respuesta es incorrecta
    if (response.statusCode != HttpStatus.ok) {
      // Devolvemos la lista vacía
      return [];
    }

    // Si la respuesta es correcta
    final jsonResponse = json.decode(response.body);
    final List characters = jsonResponse['results'];
    
    // Devolvemos la lista de personajes
    return characters.map(
      (character) => Character.fromJson(character)
    ).toList();
  }

  Future<List<Character>> getAll() async{
    // Url de la API
    final http.Response response = await http.get(
      Uri.parse('$baseUrl/character')
    );

    // Si la respuesta es incorrecta
    if (response.statusCode != HttpStatus.ok) {
      // Devolvemos la lista vacía
      return [];
    }

    // Si la respuesta es correcta
    final jsonResponse = json.decode(response.body);
    final List characters = jsonResponse['results'];
    
    // Devolvemos la lista de personajes
    return characters.map(
      (character) => Character.fromJson(character)
    ).toList();
  }
}