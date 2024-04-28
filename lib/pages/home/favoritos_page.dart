import 'package:flutter/material.dart';

class FavoritosPage extends StatelessWidget {
  final List<String> favoritos;

  FavoritosPage({required this.favoritos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Favoritos'),
          centerTitle: true,
          backgroundColor: Color(0xFF00BCD4)),
      body: ListView.builder(
        itemCount: favoritos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favoritos[index]),
          );
        },
      ),
    );
  }
}
