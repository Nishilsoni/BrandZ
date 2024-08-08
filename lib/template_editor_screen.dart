import 'package:flutter/material.dart';
import 'package:flutter_application_1/template_selection_screen.dart';
import 'logo_selection_screen.dart';
import 'select_template.dart'; // Ensure this import is correct

class TemplateEditorScreen extends StatefulWidget {
  final String imageUrl;

  TemplateEditorScreen({required this.imageUrl});

  @override
  _TemplateEditorScreenState createState() => _TemplateEditorScreenState();
}

class _TemplateEditorScreenState extends State<TemplateEditorScreen> {
  String? selectedLogoUrl;

  void _selectLogo() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LogoSelectionScreen(
          onLogoSelected: (logoUrl) {
            setState(() {
              selectedLogoUrl = logoUrl;
            });
          },
        ),
      ),
    );

    if (result != null) {
      setState(() {
        selectedLogoUrl = result;
      });
    }
  }

  void _goToTemplateSelection() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => TemplateSelectionScreen()),
    );
  }

  void _onBottomNavTapped(int index) {
    // Handle bottom navigation actions here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Template',
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 0, 242, 255),
                const Color.fromARGB(255, 33, 3, 77),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.white),
            onPressed: () {
              // Profile action
            },
          ),
          IconButton(
            icon: Icon(Icons.save, color: Colors.white),
            onPressed: () {
              // Save action
            },
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              // Handle selected menu action
            },
            itemBuilder: (BuildContext context) {
              return {'Share Link', 'Download'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Ava Smith'),
              accountEmail: Text('ava.smith@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 40.0, color: Colors.grey),
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color.fromARGB(255, 0, 242, 255),
                    const Color.fromARGB(255, 33, 3, 77),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to Home
              },
            ),
            ListTile(
              leading: Icon(Icons.folder),
              title: Text('My Projects'),
              onTap: () {
                Navigator.pop(context);
                // List projects under My Projects
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to Settings
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Image.network(
              widget.imageUrl,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(child: CircularProgressIndicator());
              },
              errorBuilder: (context, error, stackTrace) {
                return Center(child: Text('Error loading image'));
              },
            ),
            if (selectedLogoUrl != null)
              Positioned(
                bottom: 20,
                right: 20,
                child: Image.network(
                  selectedLogoUrl!,
                  width: 50,
                  height: 50,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return SizedBox(
                      width: 50,
                      height: 50,
                      child: Center(child: CircularProgressIndicator()),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.error, size: 50);
                  },
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _selectLogo,
            child: Icon(Icons.add),
            tooltip: 'Add Logo',
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: _goToTemplateSelection,
            child: Icon(Icons.image),
            tooltip: 'Select Template',
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onBottomNavTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.crop),
            label: 'Crop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_paint),
            label: 'Remove Background',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.text_fields),
            label: 'Add Text',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.color_lens),
            label: 'Text Color',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.font_download),
            label: 'Change Font',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_fix_high),
            label: 'Add Effects',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_shapes),
            label: 'Add Shapes',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color.fromARGB(255, 33, 3, 77),
        unselectedItemColor: const Color.fromARGB(255, 42, 3, 93),
      ),
    );
  }
}
