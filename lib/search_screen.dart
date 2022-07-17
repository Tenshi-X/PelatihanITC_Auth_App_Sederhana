import 'package:auth_firebase/home_screen.dart';
import 'package:flutter/material.dart';

class searchScreen extends StatefulWidget {
  searchScreen({Key? key}) : super(key: key);

  @override
  State<searchScreen> createState() => _searchScreenState();
}

class _searchScreenState extends State<searchScreen> {
  String? info = 'Loading...';
  TextEditingController titleController = TextEditingController();

  @override
  void initState() {
    info = 'Silakan Masukkan Judul Film';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pencarian Judul Film'),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title',
              ),
            ),
            ElevatedButton(
              onPressed: (() async {
               Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(title : titleController.text)));
              }),
              child: Text('Cari'),
            ),
            Text(
              info!,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(
              height: 20,
            ),
              ],
            ),
        );
  }
  }