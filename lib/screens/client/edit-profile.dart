import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  File? currentAvatar;
  //1. suanki profil fotosu
  loadCurrentProfilePhoto() {}
  //2. profil foto guncelleme
  editProflePhoto() async {
    try {
      final ImagePicker picker = ImagePicker();
      // Pick an image.
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) {
        // print("kullanici iptal etmis");
        return;
      }

      print(image.name);

      final String imageFormat = image.name.split('.').last.toLowerCase();
      final img.Image? imageBytes;
      switch (imageFormat) {
        case ("jpg"):
          // Read a jpeg image from file.
          imageBytes = img.decodeJpg(File(image.path).readAsBytesSync());
        case ("jpeg"):
          imageBytes = img.decodeJpg(File(image.path).readAsBytesSync());
        case ("png"):
          imageBytes = img.decodePng(File(image.path).readAsBytesSync());
        case ("bmp"):
          imageBytes = img.decodeBmp(File(image.path).readAsBytesSync());
        case ("gif"):
          imageBytes = img.decodeGif(File(image.path).readAsBytesSync());
        case ("tiff"):
          imageBytes = img.decodeTiff(File(image.path).readAsBytesSync());
        default:
          showDialog(
            context: context,
            builder: (context) => const AlertDialog(
              title: Text("Dosya Tipi"),
              content: Text("Sectiginiz gorsel formati desteklenmiyor."),
            ),
          );
          return;
      }

      if (imageBytes == null) {
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("Dosya Hatasi"),
            content: Text(
                "Sectiginiz gorsel hatali. kontrol ettikten sonra tekrar deneyiniz."),
          ),
        );
        return;
      }

      if (imageBytes.width <= 400 || imageBytes.height <= 400) {
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("Dosya Boyutu"),
            content: Text(
                "Sectiginiz dosya yuksekligi ve genisligi en az 400px olmalidir."),
          ),
        );
        return;
      }

      final resizedImage;

      if (imageBytes.width > imageBytes.height) {
        resizedImage = img.copyResize(imageBytes, height: 400);
      } else {
        resizedImage = img.copyResize(imageBytes, width: 400);
      }

      // resizedImage.write
      List<int> resizedBytes = img.encodeJpg(
        resizedImage,
        quality: 85,
      );

      final Directory appTempDir = await getApplicationCacheDirectory();

      File finalFinal = File("${appTempDir.path}/avt.jpg");
      print("${appTempDir.path}/avt.jpg");

      finalFinal.writeAsBytesSync(resizedBytes);

      setState(() {
        currentAvatar = finalFinal;
      });

      // Capture a photo.
      // final XFile? photo = await picker.pickImage(source: ImageSource.camera);
      // Pick a video.
      // final XFile? galleryVideo =
      //     await picker.pickVideo(source: ImageSource.gallery);
      // Capture a video.
      // final XFile? cameraVideo =
      //     await picker.pickVideo(source: ImageSource.camera);
      // Pick multiple images.
      // final List<XFile> images = await picker.pickMultiImage();
      // Pick singe image or video.
      // final XFile? media = await picker.pickMedia();
      // Pick multiple images and videos.
      // final List<XFile> medias = await picker.pickMultipleMedia();
    } on Exception catch (hata) {
      print(hata);
    }
  }

  //3. dosya boyut dusurme
  resizePhoto() {}
  //4. yeni dosyayi kayit yapmak
  saveProfilePhoto() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SizedBox.expand(
        child: ListView(
          children: [
            if (currentAvatar != null)
              // Image.file(currentAvatar!)
              CircleAvatar(
                backgroundImage: FileImage(
                  currentAvatar!,
                ),
                radius: 48,
              )
            else
              const Icon(
                Icons.person,
                size: 48,
              ),
            // CircleAvatar(
            //   backgroundImage: ,
            // ),
            OutlinedButton(
              child: Text("Change Profile Picture"),
              onPressed: editProflePhoto,
            ),
          ],
        ),
      ),
    ));
  }
}
