/*import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MusicApp());
}

class MusicApp extends StatelessWidget {
  const MusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Playlist',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
      home: const MusicHomePage(),
    );
  }
}

class MusicHomePage extends StatefulWidget {
  const MusicHomePage({super.key});

  @override
  _MusicHomePageState createState() => _MusicHomePageState();
}

class _MusicHomePageState extends State<MusicHomePage> {
  List<dynamic> _musicList = [];

  // ฟังก์ชันสำหรับโหลดข้อมูล JSON
  Future<void> loadJsonData() async {
    String jsonString =
        await rootBundle.loadString('assets/data/Musiclist.json');
    final jsonResponse = json.decode(jsonString);
    setState(() {
      _musicList = jsonResponse['musiclist'];
    });
  }

  @override
  void initState() {
    super.initState();
    loadJsonData(); // โหลดข้อมูล JSON เมื่อแอปเริ่มทำงาน
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Music Playlist',
          style: GoogleFonts.itim(fontSize: 22),
        ),
      ),
      body: _musicList.isNotEmpty
          ? ListView.builder(
              itemCount: _musicList.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: ListTile(
                    leading: Icon(Icons.music_note),
                    title: Text(
                      _musicList[index]['name'], // แสดงชื่อประเภทเพลง
                      style: GoogleFonts.itim(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      // เมื่อกดรายการเพลง จะนำทางไปยังหน้าถัดไป
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SongCountPage(
                            name: _musicList[index]['name'],
                            playlistCount:
                                int.parse(_musicList[index]['playlist']),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator()), // แสดงการโหลดข้อมูล
    );
  }
}

// หน้าถัดไปที่จะรับข้อมูลเพลงและแสดงจำนวนเพลง
class SongCountPage extends StatelessWidget {
  final String name;
  final int playlistCount;

  const SongCountPage(
      {super.key, required this.name, required this.playlistCount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Songs in $name',
          style: GoogleFonts.itim(fontSize: 22),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Playlist: $name',
              style:
                  GoogleFonts.itim(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // แสดงจำนวนเพลงในรูปแบบคอลัมน์
            Expanded(
              child: ListView.builder(
                itemCount: playlistCount,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.music_note),
                    title: Text('Song ${(index + 1)}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/
