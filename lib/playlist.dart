import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_fonts/google_fonts.dart';
//import 'package:shopping/main.dart';

class Musicplay extends StatefulWidget {
  @override
  _MusicplayState createState() => _MusicplayState();
}

class _MusicplayState extends State<Musicplay> {
  List<dynamic> _Musiclist = [];

  // ฟังก์ชันสำหรับโหลดข้อมูล JSON
  Future<void> loadJsonData() async {
    String jsonString = await rootBundle.loadString('data/Musiclist.json');
    setState(() {
      _Musiclist = json.decode(jsonString); // แปลงข้อมูลจาก JSON
    });
  }

  @override
  void initState() {
    super.initState();
    loadJsonData(); // โหลดข้อมูลเมื่อแอปเริ่มทำงาน
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PLAYLIST',
          style: GoogleFonts.itim(fontSize: 22, color: Color(0xff000000)),
        ),
      ),
      body: _Musiclist.isNotEmpty
          ? ListView.builder(
              itemCount: _Musiclist.length,
              itemBuilder: (context, index) {
                return Card(
                  color: index % 2 == 0 ? Color(0xfffd99ba) : Color(0xfffd99ba),
                  elevation: 10,
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    leading: Icon(Icons.music_note),
                    title: Text(
                      _Musiclist[index]['name'], // แสดงประเภทเพลง
                      style: GoogleFonts.itim(
                        fontSize: 22,
                        color: Color(0xfff9f9f9),
                      ),
                    ),
                    subtitle: Text(
                      _Musiclist[index]['playlist'], // แสดงจำนวนเพลงในเพลย์ลิส
                    ),
                    onTap: () {
                      // เมื่อกดรายการเพลง จะนำทางไปยังหน้าถัดไป
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SongCountPage(
                            name: _Musiclist[index]['name'],
                            playlistCount:
                                int.parse(_Musiclist[index]['playlist']),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            )
          : Center(child: CircularProgressIndicator()), // แสดงการโหลดข้อมูล
    );
  }
}

/*class ListItemPage extends StatelessWidget {
  final Map<String, dynamic> Musiclist;

  const ListItemPage({super.key, required this.Musiclist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PLAY MUSIC',
          style: GoogleFonts.itim(fontSize: 22),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}*/

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
          'TYPE IN $name',
          style: GoogleFonts.itim(fontSize: 22),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'TYPE: $name',
              style:
                  GoogleFonts.itim(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // แสดงจำนวนเพลงในรูปแบบคอลัมน์
            Expanded(
              child: ListView.builder(
                itemCount: playlistCount,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                        vertical: 8), // Spacing between items
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.pink, width: 2), // Pink border
                      borderRadius:
                          BorderRadius.circular(12), // Rounded corners
                      color: Colors.white, // Background color of the box
                    ),
                    child: ListTile(
                      leading: Icon(Icons.music_note, color: Colors.pink),
                      title: Text(
                        'Song ${(index + 1)}',
                        style: GoogleFonts.itim(
                          fontSize: 18,
                          color: Colors.black,
                        ),
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
