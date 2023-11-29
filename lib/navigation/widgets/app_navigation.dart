import 'package:flutter/material.dart';
import 'package:repaso_mov/character_hub/screens/favorites.dart';
import 'package:repaso_mov/character_hub/screens/search_page.dart';
import 'package:repaso_mov/public/screens/home.dart';

class AppNavigation extends StatefulWidget {
  const AppNavigation({super.key});

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
   //Index que servirá para controlar el estado de la barra de navegación
  int _selectedIndex = 0;

  //lista de widgets que se mostrarán en la pantalla
  final List<Widget> _screens = <Widget>[
    Home(),
    SearchPage(),
    Favorites(),
  ];

  //funcion que se encargará de cambiar el estado de la barra de navegación
  void _navigateBottomNavBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Barra superior
      appBar: AppBar(title: const Text('Rick and Morty Demo'), backgroundColor: Color.fromARGB(255, 79, 219, 219)),


      //Cuerpo de la pantalla que cambia según el index
      body: _screens[_selectedIndex],

      //Barra de navegación inferior
      bottomNavigationBar: BottomNavigationBar(
        //Index que controla el estado de la barra de navegación
        currentIndex: _selectedIndex,
        //Función que se ejecuta cuando se pulsa un elemento de la barra de navegación
        onTap: _navigateBottomNavBar,
        //Lista de elementos de la barra de navegación
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Info',),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Characters',),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites',),
        ],
        backgroundColor: const Color.fromARGB(255, 79, 219, 219)
      )


    );
  }
}