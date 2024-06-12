import 'package:flutter/material.dart';

import 'printgaji.dart';

class GajiPage extends StatelessWidget {
  // Detail gaji
  final double gajiPokok = 10000000;
  final double tunjangan = 5000000;
  final double totalGaji = 15000000; // Menggunakan nilai konstan untuk total gaji

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gaji'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Halaman Gaji',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.05,
                    top:MediaQuery.of(context).size.height * 0.01,
                  ),
                  child: Container(
                    
                    height: MediaQuery.of(context).size.height * 0.1,
                    color: Colors.blue,
                    child: Center(
                      child: Text(
                        'Gaji Pokok: Rp ${gajiPokok.toStringAsFixed(0)}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.05,
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    color: Colors.green,
                    child: Center(
                      child: Text(
                        'Tunjangan: Rp ${tunjangan.toStringAsFixed(0)}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                 padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.05,
                  ),
                  child: Container(
                  
                    height: MediaQuery.of(context).size.height * 0.1,
                    color: Colors.orange,
                    child: Center(
                      child: Text(
                        'Total Gaji: Rp ${totalGaji.toStringAsFixed(0)}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                PrintPdf(),
              ],
            ),
            // Di sini Anda dapat menambahkan widget dan logika untuk menampilkan detail absensi
          ],
        ),
      ),
    );
  }
}
