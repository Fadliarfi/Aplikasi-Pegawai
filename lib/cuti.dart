import 'package:flutter/material.dart';

class CutiPage extends StatefulWidget {
  @override
  _CutiPageState createState() => _CutiPageState();
}

class _CutiPageState extends State<CutiPage> {
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Cuti'),
        elevation: 0, // Menghapus bayangan di bawah AppBar
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20.0), // Spacer antara judul dan kolom kalender
              Text(
                'Halaman Cuti',
                style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.0), // Spacer antara judul dan kolom kalender
              TextFormField(
                controller: _startDateController,
                decoration: InputDecoration(
                  labelText: 'Tanggal Awal Cuti',
                  border: OutlineInputBorder(),
                ),
                onTap: () {
                  _selectDate(context, _startDateController);
                },
                readOnly: true,
              ),
              SizedBox(height: 20.0), // Spacer antara kolom tanggal awal dan akhir cuti
              TextFormField(
                controller: _endDateController,
                decoration: InputDecoration(
                  labelText: 'Tanggal Akhir Cuti',
                  border: OutlineInputBorder(),
                ),
                onTap: () {
                  _selectDate(context, _endDateController);
                },
                readOnly: true,
              ),
              SizedBox(height: 20.0), // Spacer antara kolom tanggal akhir dan deskripsi cuti
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Deskripsi Cuti (Alasan)',
                  border: OutlineInputBorder(),
                ),
                maxLines: null, // Untuk mengizinkan banyak baris
              ),
              SizedBox(height: 20.0), // Spacer antara kolom deskripsi cuti dan tombol
              ElevatedButton(
              onPressed: () {
                // Menampilkan snackbar saat tombol ditekan
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Cuti telah diajukan. Silahkan tunggu.'),
                  ),
                );
              },
              child: Text('Ajukan Cuti'),
            ),
        
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi untuk menampilkan kalender
  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        controller.text = picked.toString(); // Update nilai pada TextEditingController
      });
    }
  }
}
