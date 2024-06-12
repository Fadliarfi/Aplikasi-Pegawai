import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AbsensiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Absensi'),
      ),
      body: Center(
        child: AbsensiCalendar(), // Menampilkan kalender absensi
      ),
    );
  }
}

class AbsensiCalendar extends StatefulWidget {
  @override
  _AbsensiCalendarState createState() => _AbsensiCalendarState();
}

class _AbsensiCalendarState extends State<AbsensiCalendar> {
  DateTime _selectedDay = DateTime.now();
  Map<DateTime, bool> _absensiData = {}; // Simpan informasi absensi

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.5, vertical: 10.0),
            child: TableCalendar(
              focusedDay: _selectedDay,
              firstDay: DateTime(2020),
              lastDay: DateTime(2040),
              calendarFormat: CalendarFormat.month,
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  // Tambahkan logika untuk menandai atau menghapus absensi
                  if (_absensiData.containsKey(selectedDay)) {
                    _absensiData.remove(selectedDay); // Hapus absensi jika sudah ada
                  } else {
                    _absensiData[selectedDay] = true; // Tandai absensi jika belum ada
                  }
                });
              },
              selectedDayPredicate: (day) {
                return _absensiData[day] ?? false; // Cek apakah tanggal sudah diabsen
              },
            ),
          ),
          SizedBox(height: 10), // Spasi antara kalender dan tombol
          ElevatedButton(
            onPressed: () {
              _submitAbsen(context); // Panggil _submitAbsen dengan context
            },
            child: Text('Submit'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.5, vertical: 10.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                color: Colors.brown,
                image: DecorationImage(
                  image: AssetImage('assets/map.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _submitAbsen(BuildContext context) {
    // Simpan atau kirim data absensi ke server
    print('Data absen disimpan: $_absensiData');
    // Reset data absensi setelah submit
    _absensiData.clear();
    // Tambahkan logika lain yang diperlukan setelah submit

    // Tampilkan notifikasi melayang
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Anda berhasil absen'),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AbsensiPage(),
  ));
}
