import 'package:flutter/material.dart';
import 'package:flutter_application_1/homepage.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        // Tidak ada judul pada appbar
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Widget Logo
              Image.asset(
                'assets/2.png', // Ganti dengan path logo Anda
                width: 200, // Sesuaikan ukuran logo sesuai kebutuhan
                height: 200,
              ),
              SizedBox(height: 20.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true, // Menyembunyikan teks yang dimasukkan (password)
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage())
                    );
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
