import 'package:flutter/material.dart';
import 'package:flutter_application_1/Login_in.dart';
import 'package:flutter_application_1/splash.dart';
import 'template_editor_screen.dart';
import 'saved_templates_screen.dart';

void main() {
  runApp(MyTemplatesApp());
}

class MyTemplatesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Templates App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class HomeScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Templates App'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, const Color.fromARGB(255, 38, 7, 71)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,

            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Handle profile action
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TemplateEditorScreen(
                      imageUrl: 'https://example.com/placeholder-image.png',
                    ),
                  ),
                );
              },
              child: Text('Create New Template'),
            ),
            SizedBox(height: 20), // Add some spacing between buttons
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
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
