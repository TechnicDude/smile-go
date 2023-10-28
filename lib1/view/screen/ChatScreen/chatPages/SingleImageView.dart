import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';

class SingleImageView extends StatelessWidget {
  String image;
  SingleImageView(this.image, {Key? key}) : super(key: key);
  // saveImage() async {
  //   //    File imageFile = new File(image.path);
  //   // List<int> imageBytes = imageFile.readAsBytesSync();
  //   File imageFile = File(base64Decode(image).toString());
  //   File imageFile1 = new File(imageFile.path);
  //   print(imageFile1);
  //   final Directory extDir = await getApplicationDocumentsDirectory();
  //   String dirPath = extDir.path;
  //   final String filePath = '$dirPath/image.png';
  //   final File newImage = await imageFile.copy(filePath);
  //   print(newImage);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondrycolors,
        actions: [
          SizedBox(
            width: 20,
          ),
          // InkWell(
          //     onTap: () {
          //       saveImage();
          //     },
          //     child: Icon(Icons.download)),
          // SizedBox(
          //   width: 20,
          // ),
        ],
      ),
      // Implemented with a PageView, simpler than setting it up yourself
      // You can either specify images directly or by using a builder as in this tutorial
      body: PhotoViewGallery.builder(
        itemCount: 1,
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: MemoryImage(base64.decode(image.toString())),
            minScale: PhotoViewComputedScale.contained * 1,
            maxScale: PhotoViewComputedScale.covered * 2,
          );
        },
        scrollPhysics: BouncingScrollPhysics(),
        backgroundDecoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
        ),
      ),
    );
  }
}
