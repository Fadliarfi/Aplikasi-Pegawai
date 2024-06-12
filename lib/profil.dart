import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Container(
  width: 120,
  height: 120,
  decoration: BoxDecoration(
    color: Colors.brown,
    shape: BoxShape.circle,
    image: DecorationImage(
      image: AssetImage("assets/poto.jpg"),
      fit: BoxFit.cover,
    ),
  ),
),
            SizedBox(height: 20),
            Text(
              'Fadli Ichwanul Arfi',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'fadliarfi01@gmail.com',
              style: TextStyle(fontSize: 18),
            ),
             SizedBox(height: 5),
            Text(
              'Pegawai',
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Tambahkan fungsi untuk mengubah profil
              },
              child: Text('Ubah Profil'),
            ),
          ],
        ),
      ),
    );
  }
}
