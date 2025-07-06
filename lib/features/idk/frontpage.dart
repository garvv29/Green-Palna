import 'package:flutter/material.dart';
import 'newsystem.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({Key? key}) : super(key: key);

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  String _selectedLanguage = 'English';
  final List<String> _languages = ['English', 'Hindi', 'Marathi'];

  void _navigateToRegistration(BuildContext context, String headerTitle) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            LocalWorkerProfileFormScreen(headerTitle: headerTitle),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6FFF6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Green Cradle Initiative',
              style: TextStyle(
                color: Colors.green[800],
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            DropdownButton<String>(
              value: _selectedLanguage,
              underline: const SizedBox(),
              icon: Icon(Icons.language, color: Colors.green[800]),
              items: _languages.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedLanguage = newValue!;
                });
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              _buildButton('Local Worker', Icons.person, context),
              const SizedBox(height: 24),
              _buildButton(
                'Nurse/Health Worker',
                Icons.medical_services,
                context,
              ),
              const SizedBox(height: 24),
              _buildButton('Other', Icons.group, context),
              const SizedBox(height: 40),
              // Show the selected button as a preview header below the buttons
              Text(
                'Selected: ${_getSelectedHeader()}',
                style: TextStyle(
                  color: Colors.green[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 2,
                width: 120,
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.green[700],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _selectedHeader = '';

  Widget _buildButton(String text, IconData icon, BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green[700],
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        icon: Icon(icon, size: 26),
        label: Text(text),
        onPressed: () {
          setState(() {
            _selectedHeader = text;
          });
          _navigateToRegistration(context, text);
        },
      ),
    );
  }

  String _getSelectedHeader() {
    return _selectedHeader.isEmpty ? 'None' : _selectedHeader;
  }
}
