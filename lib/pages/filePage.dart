import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class FileSource extends StatefulWidget {
  const FileSource({Key? key}) : super(key: key);

  @override
  State<FileSource> createState() => _FileSourceState();
}

//funkcja do otworzenia biblioteki zdjęć i zapisania wybranego
class _FileSourceState extends State<FileSource> {
  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      debugPrint('Nie udało się wybrać zdjęcia: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    pickImage();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dodaj zdjęcie'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/asdf3.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 40),
            image != null
                ? Image.file(image!)
                : const Text('Brak wybranego zdjęcia'),
            const SizedBox(height: 40),
            image != null
                ? OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        primary: const Color(0xFFC5983D),
                        minimumSize: const Size(280, 80)),
                    onPressed: () {
                      debugPrint('Dobierz fryzurę');
                    },
                    child: const Text('Dobierz fryzurę'))
                : const Text('Brak wybranego zdjęcia'),
          ],
        ),
      ),
    );
  }
}
