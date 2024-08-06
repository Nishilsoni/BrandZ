import 'package:flutter/material.dart';
import 'template_editor_screen.dart';
import 'saved_templates_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Templates App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TemplateEditorScreen()),
                );
              },
              child: Text('Create New Template'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SavedTemplatesScreen()),
                );
              },
              child: Text('View Saved Templates'),
            ),
          ],
        ),
      ),
    );
  }
}
