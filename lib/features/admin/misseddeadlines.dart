import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Ensure flutter_svg is in pubspec.yaml

// SVG path for arrow-left icon (assuming same as previously provided)
const String _arrowLeftSvg = '''
  <svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" fill="currentColor" viewBox="0 0 256 256">
    <path d="M224,128a8,8,0,0,1-8,8H59.31l58.35,58.34a8,8,0,0,1-11.32,11.32l-72-72a8,8,0,0,1,0-11.32l72-72a8,8,0,0,1,11.32,11.32L59.31,120H216A8,8,0,0,1,224,128Z"></path>
  </svg>
''';

class MissedDeadlinesPage extends StatefulWidget {
  const MissedDeadlinesPage({super.key});

  @override
  State<MissedDeadlinesPage> createState() => _MissedDeadlinesPageState();
}

class _MissedDeadlinesPageState extends State<MissedDeadlinesPage> {
  // Updated Dummy data for missed deadlines. Each entry is now a single mother.
  final List<Map<String, String>> _missedMothers = [
    {
      'motherName': 'Priya Devi',
      'contact': '+91-9876543210',
      'allottedMitanin': 'Kiran Sharma',
      'missedWeek': 'July 1 - July 7, 2025 (Week 1)',
    },
    {
      'motherName': 'Sunita Sharma',
      'contact': '+91-9988776655',
      'allottedMitanin': 'Seema Devi',
      'missedWeek': 'July 1 - July 7, 2025 (Week 1)',
    },
    {
      'motherName': 'Geeta Singh',
      'contact': '+91-9123456789',
      'allottedMitanin': 'Kiran Sharma',
      'missedWeek': 'July 8 - July 14, 2025 (Week 2)',
    },
    {
      'motherName': 'Anjali Kumari',
      'contact': '+91-9012345678',
      'allottedMitanin': 'Poonam Yadav',
      'missedWeek': 'July 15 - July 21, 2025 (Week 3)',
    },
    {
      'motherName': 'Kavita Mishra',
      'contact': '+91-8765432109',
      'allottedMitanin': 'Seema Devi',
      'missedWeek': 'July 15 - July 21, 2025 (Week 3)',
    },
    {
      'motherName': 'Ritu Gupta',
      'contact': '+91-7654321098',
      'allottedMitanin': 'Poonam Yadav',
      'missedWeek': 'July 15 - July 21, 2025 (Week 3)',
    },
    {
      'motherName': 'Neha Verma',
      'contact': '+91-6543210987',
      'allottedMitanin': 'Kiran Sharma',
      'missedWeek': 'July 22 - July 28, 2025 (Week 4)',
    },
    // Add more dummy data as needed
  ];

  final String _selectedSubdivision = 'Collector';

  // Helper function to create SVG icon widgets from path strings
  Widget _buildSvgIcon(String path, {double? width, double? height, Color? color}) {
    return SvgPicture.string(
      path,
      width: width,
      height: height,
      color: color ?? const Color(0xFF0E1A13), // Default color or specified color
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FBFA),
      body: SafeArea(
        child: Column(
          children: [
            // Top Header
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Go back
                    },
                    child: SizedBox(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: _buildSvgIcon(_arrowLeftSvg),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      'Missed Deadlines',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF0E1A13),
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        height: 1.25,
                        letterSpacing: -0.015 * 18,
                      ),
                    ),
                  ),
                  const SizedBox(width: 48), // Spacer for alignment
                ],
              ),
            ),

            // Main Content Area - List of Mothers
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemCount: _missedMothers.length,
                itemBuilder: (context, index) {
                  final mother = _missedMothers[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0), // Spacing between cards
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white, // Card background
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withValues(alpha: 0.1),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFDDC1), // Light orange/skin color for avatar
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                mother['motherName']![0].toUpperCase(), // First letter of name
                                style: const TextStyle(
                                  color: Color(0xFFE65100), // Darker orange
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  mother['motherName']!,
                                  style: const TextStyle(
                                    color: Color(0xFF0E1A13),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    height: 1.25,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Contact: ${mother['contact']}',
                                  style: const TextStyle(
                                    color: Color(0xFF51946B), // Greenish color
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    height: 1.25,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Allotted Mitanin: ${mother['allottedMitanin']}',
                                  style: const TextStyle(
                                    color: Color(0xFF51946B),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    height: 1.25,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Missed Week: ${mother['missedWeek']}',
                                  style: const TextStyle(
                                    color: Colors.red, // Indicate missed deadline
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}