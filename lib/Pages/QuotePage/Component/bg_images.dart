import 'package:flutter/material.dart';
import 'package:quote_app/Pages/QuotePage/Component/heading.dart';
import 'package:quote_app/utils/Globals/globals.dart';

Widget bgImage(
    {required size, required dynamic selectedImage, required getsetstate}) {
  return Column(
    children: [
      heading(heading: 'BackGround Image'),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: Globals.img.map((image) {
            return GestureDetector(
              onTap: () {
                selectedImage = image;
                getsetstate(); // Update background image
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: size.width * 0.4,
                height: size.height * 0.1,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: image.startsWith('assets')
                        ? AssetImage(image)
                        : NetworkImage(image) as ImageProvider,
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Colors.black,
                    width: selectedImage == image ? 3 : 1,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    ],
  );
}
