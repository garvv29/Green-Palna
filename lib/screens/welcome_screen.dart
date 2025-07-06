import 'package:flutter/material.dart';
import 'package:gp1/screens/role_selection_screen.dart'; // Import the RoleSelectionScreen

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  // All green colors updated to #22c55e (Color(0xFF22C55E))
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FBF9), // bg-[#f9fbf9]
      body: SafeArea(
        child: Column(
          children: [
            // Header Section
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
              child: Text(
                'Green Palna',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF121810),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                  letterSpacing: -0.015 * 20,
                ),
              ),
            ),
            // Image Section
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: AspectRatio(
                  aspectRatio: 2 / 3, // Maintain original aspect ratio
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF9FBF9),
                      borderRadius: BorderRadius.circular(16),
                      image: const DecorationImage(
                        image: NetworkImage(
                            'https://lh3.googleusercontent.com/aida-public/AB6AXuDUNvMyNc94bfqFnHUGkqFaXAqA_WUoy7rxQN3fHH0Zbu_o6AMu46Dxf6W4pGwX77CiMoDait9ToJr3DoZMQR5_A0XN430urQcg0tmmFZjEjDDuc-gq8A0XRJ71vQjHDxzEotZDbZf7dRJq5WBJ1JnLnLtGQI-fzhWD1RfNfAbE99z-WXIAZ8Okt8xcNAngAxgfR_xcWLZsKSFX_lv-HxL6HiuWceyR2_roTmY_PV6DcPeWbvSbHzvJa4cHAqm2KbtqpDpohHYS8KQ'),
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Welcome Title
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 25, 16, 15),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Welcome to the Green Palna Initiative',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF121810),
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                    letterSpacing: -0.025 * 34,
                  ),
                ),
              ),
            ),
            // Description Paragraph
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 18),
                child: Text(
                  'Join us in nurturing new life and a greener future. Get your free fruit-bearing plant and track its growth with us.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF121810),
                    fontSize: 22,
                    fontWeight: FontWeight.normal,
                    height: 1.4,
                  ),
                ),
              ),
            ),
            // Get Started Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: SizedBox(
                height: 52,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RoleSelectionScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF34A853),
                    foregroundColor: const Color(0xFF121810),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    elevation: 2,
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                      letterSpacing: 0.015 * 18,
                    ),
                  ),
                ),
              ),
            ),
            // Bottom Spacer
            Container(
              height: 25,
              color: const Color(0xFFF9FBF9),
            ),
          ],
        ),
      ),
    );
  }
}