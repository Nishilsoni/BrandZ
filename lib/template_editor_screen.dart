import 'package:flutter/material.dart';
import 'package:flutter_application_1/template_editor.dart';
// import '../widgets/template_editor.dart';

class TemplateEditorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Template Editor'),
      ),
      body: TemplateEditor(),
    );
  }
}
