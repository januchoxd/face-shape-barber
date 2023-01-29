import 'package:flutter/material.dart';
import 'package:faceshapebarber/pages/cameraPage.dart';
import 'package:faceshapebarber/pages/filePage.dart';
import 'package:faceshapebarber/pages/proba.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Barber demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFFFEFAFB),
        appBarTheme: const AppBarTheme(color: Color(0xFF010A20)),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Barber Skaner',
          style: TextStyle(color: Color(0xFFC5983D)),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/asdf3.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  child: const Image(
                      color: Color(0xFFC5983D),
                      image: AssetImage("assets/images/face_recog.png"))),
              const SizedBox(
                height: 50,
              ),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      primary: const Color(0xFFC5983D),
                      minimumSize: const Size(280, 80)),
                  onPressed: () {
                    debugPrint('zrob zdjecie');
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext context) {
                        return const MyHomePageTwo(title: 't');
                      }),
                    );
                  },
                  child: const Text('Zrób zdjęcie')),
              const SizedBox(
                height: 20,
              ),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      primary: const Color(0xFFC5983D),
                      minimumSize: const Size(280, 80)),
                  onPressed: () {
                    debugPrint('dodaj zdjecie');
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext context) {
                        return const FileSource();
                      }),
                    );
                  },
                  child: const Text('Dodaj zdjęcie')),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        selectedItemColor: const Color(0xFFC5983D),
        backgroundColor: const Color(0xFF010A20),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.face_outlined),
            label: 'Skanuj Twarz',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.find_replace_outlined), label: 'Twoje Frycki'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_outlined), label: 'Profil')
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
