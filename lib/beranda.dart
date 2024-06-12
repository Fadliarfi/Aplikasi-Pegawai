import 'package:flutter/material.dart';
import 'package:flutter_application_1/absensi.dart';
import 'package:flutter_application_1/cuti.dart';
import 'package:flutter_application_1/gaji.dart';

class BerandaPage extends StatefulWidget {
  @override
  _BerandaPageState createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> items = [
    {'title': 'Absensi', 'icon': Icons.access_time, 'color': Colors.blue, 'page': AbsensiPage()},
    {'title': 'Gaji', 'icon': Icons.attach_money, 'color': Colors.green, 'page': GajiPage()},
    {'title': 'Cuti', 'icon': Icons.date_range, 'color': Colors.orange, 'page': CutiPage()},
  ];
  List<Map<String, dynamic>> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = items;
  }

  void _filterItems(String query) {
    final results = items.where((item) => item['title'].toLowerCase().contains(query.toLowerCase())).toList();
    setState(() {
      filteredItems = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beranda'),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Aksi ketika tombol kembali ditekan
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Cari...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              ),
              onChanged: _filterItems,
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  final item = filteredItems[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Card(
                      child: ListTile(
                        contentPadding: EdgeInsets.only(left: 16.0), // Geser ikon ke kiri
                        leading: Icon(item['icon'], color: item['color']),
                        title: Text(item['title'], style: TextStyle(color: item['color'])),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => item['page']),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 