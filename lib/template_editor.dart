import 'package:flutter/material.dart';

class TemplateEditor extends StatefulWidget {
  @override
  _TemplateEditorState createState() => _TemplateEditorState();
}

class _TemplateEditorState extends State<TemplateEditor> {
  Offset position = Offset(100, 100);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: position.dx,
          top: position.dy,
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                position = Offset(position.dx + details.delta.dx, position.dy + details.delta.dy);
              });
            },
            child: Container(
              width: 100,
              height: 50,
              color: Colors.blue,
              child: Center(child: Text('Drag me')),
            ),
          ),
        ),
      ],
    );
  }
}
