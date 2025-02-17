import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final Function(bool) onLanguageChange; // Callback to change language state

  const SettingsScreen({super.key, required this.onLanguageChange});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isMarathi = false; // State to track language selection

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Title for the settings screen
            Text(
              'Select Language',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 20),

            // Radio buttons for language selection
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Radio<bool>(
                  value: false,
                  groupValue: _isMarathi,
                  onChanged: (value) {
                    setState(() {
                      _isMarathi = value!;
                    });
                    widget.onLanguageChange(false); // Notify the HomeScreen
                  },
                ),
                Text(
                  'English',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Radio<bool>(
                  value: true,
                  groupValue: _isMarathi,
                  onChanged: (value) {
                    setState(() {
                      _isMarathi = value!;
                    });
                    widget.onLanguageChange(true); // Notify the HomeScreen
                  },
                ),
                Text(
                  'मराठी',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Button to save changes
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close the settings screen
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
              ),
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
