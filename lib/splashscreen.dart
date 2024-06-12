import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Delay 3 detik sebelum pindah ke halaman berikutnya
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()), // Ganti HomePage dengan halaman berikutnya
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Ganti dengan warna latar belakang yang diinginkan
      body: Center(
        // Menampilkan gambar sebagai tampilan splash screen
        child: Image.asset(
          'assets/1.png', // Ganti 'splash_image.png' dengan nama file gambar yang digunakan
          width: 300, // Sesuaikan ukuran gambar dengan kebutuhan
          height: 300,
        ),
      ),
    );
  }
}