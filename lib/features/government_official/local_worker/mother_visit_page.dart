import 'package:flutter/material.dart';

class MotherVisitPage extends StatefulWidget {
  final String motherName;
  const MotherVisitPage({super.key, required this.motherName});

  @override
  State<MotherVisitPage> createState() => _MotherVisitPageState();
}

class _MotherVisitPageState extends State<MotherVisitPage> {
  String? selectedOption;
  // For image upload simulation
  String? uploadedImagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.motherName),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Select Option',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: selectedOption,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
              ),
              items: const [
                DropdownMenuItem(value: 'Mango', child: Text('Mango')),
                DropdownMenuItem(value: 'Guava', child: Text('Guava')),
                DropdownMenuItem(
                  value: 'Indian gooseberry',
                  child: Text('Indian gooseberry'),
                ),
                DropdownMenuItem(value: 'Papaya', child: Text('Papaya')),
                DropdownMenuItem(
                  value: 'Drumstick tree',
                  child: Text('Drumstick tree'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  selectedOption = value;
                });
              },
              hint: const Text('Choose an option'),
            ),
            const SizedBox(height: 24),
            const Text(
              'Sapling Photo Upload',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                // Simulate image upload
                setState(() {
                  uploadedImagePath = 'assets/demo_sapling.png';
                });
              },
              child: Container(
                width: double.infinity,
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: uploadedImagePath == null
                    ? const Center(child: Text('Tap to upload image'))
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.image,
                              size: 48,
                              color: Colors.green,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Image uploaded!',
                              style: TextStyle(color: Colors.green),
                            ),
                          ],
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  // Simulate submit
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('Submitted!')));
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
