import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoSelectionScreen extends StatelessWidget {
  final Function(String) onLogoSelected;

  LogoSelectionScreen({required this.onLogoSelected});

  final List<String> logos = [
    "https://upload.wikimedia.org/wikipedia/commons/9/96/Microsoft_logo_%282012%29.svg",
    "https://upload.wikimedia.org/wikipedia/commons/a/a9/Amazon_logo.svg",
    "https://upload.wikimedia.org/wikipedia/commons/9/9d/Toyota_carlogo.svg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Logo')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: logos.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              onLogoSelected(logos[index]);
              Navigator.pop(context);
            },
            child: SvgPicture.network(
              logos[index],
              placeholderBuilder: (BuildContext context) => Container(
                padding: const EdgeInsets.all(30.0),
                child: const CircularProgressIndicator(),
              ),
            ),
          );
        },
      ),
    );
  }
}