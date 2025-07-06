import 'package:flutter/material.dart';
import 'package:gp1/screens/role_selection_screen.dart'; // Import the RoleSelectionScreen

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  // All green colors updated to #22c55e (Color(0xFF22C55E))
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/sp.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Foreground content
          Column(
            children: [
              const Spacer(flex: 5), // Reduced from 6 to move content up
              // Add extra space to move title lower
              const SizedBox(height: 20), // Reduced from 29
              // Title and tagline (above button)
              Column(
                children: [
                  const Text(
                    'Green',
                    style: TextStyle(
                      color: Color(0xFF121810),
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.015 * 32,
                    ),
                  ),
                  SizedBox(height: 3), // Space below 'Green'
                  Text(
                    'पालना',
                    style: TextStyle(
                      color: Color(0xFF34A853),
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.015 * 36,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'हर जन्म के साथ हरियाली',
                    style: TextStyle(
                      color: Color(0xFF121810),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.01 * 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6), // Reduced from 8 to move button up
              // Get Started Button (slightly higher)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RoleSelectionScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF34A853),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      elevation: 2,
                    ),
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.015 * 18,
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 4),
            ],
          ),
        ],
      ),
    );
  }
}