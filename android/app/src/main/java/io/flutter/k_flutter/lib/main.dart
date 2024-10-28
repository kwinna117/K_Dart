import 'package:flutter/material.dart';
import 'package:shopping/playlist.dart';
import 'package:google_fonts/google_fonts.dart';
import 'playlist.dart';

void main() {
  runApp(const MusicApp());
}

/*
[2 whitespaces or 1 tab]assets:
[4 whitespaces or 2 tabs]- images/pizza1.png
[4 whitespaces or 2 tabs]- images/pizza0.png
 */

/*
https://pub.dev/packages/http/install


 */

class MusicApp extends StatelessWidget {
  const MusicApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MUSIC',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
      home: const ShoppingHomePage(title: 'MUSIC APP'),
    );
  }
}

class ShoppingHomePage extends StatefulWidget {
  const ShoppingHomePage({super.key, required this.title});
  final String title;

  @override
  State<ShoppingHomePage> createState() => _ShoppingHomePageState();
}

class _ShoppingHomePageState extends State<ShoppingHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
                "https://cdn11.bigcommerce.com/s-af2f8xc7r2/products/8738/images/10193/Fun_Stuffs-02__84944.1583939934.500.750.png?c=2",
                width: 500,
                height: 400),
            Text('MUSIC PLAYLIST', style: GoogleFonts.itim(fontSize: 25)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print("Play button pressed");

                Navigator.push(
                  // ใช้ Navigator เพื่อเปิดไปยังหน้าใหม่
                  context,
                  MaterialPageRoute(builder: (context) => Musicplay()),
                );
              },
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(fontSize: 25),
              ),
              child: const Text('MUSIC'),
            ),
          ],
        ),
      ),
    );
  }
}
