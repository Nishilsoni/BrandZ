import 'package:flutter/material.dart';
import 'package:flutter_application_1/select_template.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FestivalSvgImage extends StatelessWidget {
  final FestivalImage festivalImage;
  final double width;
  final double height;

  const FestivalSvgImage({
    Key? key,
    required this.festivalImage,
    this.width = 100,
    this.height = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return festivalImage.imageUrl.isNotEmpty
        ? SvgPicture.network(
            festivalImage.imageUrl,
            width: width,
            height: height,
            placeholderBuilder: (BuildContext context) => Container(
              padding: const EdgeInsets.all(30.0),
              child: const CircularProgressIndicator(),
            ),
          )
        : Image.network(
            festivalImage.imageUrl,
            width: width,
            height: height,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                width: width,
                height: height,
                child: Center(child: CircularProgressIndicator()),
              );
            },
          );
  }
}