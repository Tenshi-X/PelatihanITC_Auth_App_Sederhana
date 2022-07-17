import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  
  HomePage({Key? key, required this.title}) : super(key: key);
  
  final String title;
  dynamic poster;
  String? info = 'Loading...';
  int apiKey = 65159463;
  Map data = {};
  List film = [];

  getData() async {
    var response = await http
        .get(Uri.parse('http://www.omdbapi.com/?apikey=$apiKey&s=$title'));
    var data = (json.decode(response.body) as Map<dynamic, dynamic>)['Search'];
    if (response.statusCode == 200) {
      info = 'Pencarian berhasil';
      data.forEach((element) {
        film.add(element);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pencarian Judul Film'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: film.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(film[index]['Title']),
                  subtitle: Text(film[index]['Year']),
                  leading: Image.network(
                    film[index]['Poster'],
                    fit: BoxFit.cover,
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Center(
              child: Text(info!),
            );
          }
        },
      ),
    );
  }
}
