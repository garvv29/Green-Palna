import 'package:flutter/material.dart';
import 'package:gp1/features/mother/mother_login_page.dart';
import 'package:gp1/features/health_worker/health_worker_login_page.dart';
import 'package:gp1/features/government_official/government_official_login_page.dart';
import 'package:gp1/features/admin/admin_login_page.dart';

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  String? _selectedRole = 'Mother'; // Initial selected role

  // Define the new green color for consistency, as per your latest instruction
  static const Color _primaryGreen = Color(0xFF50D22C);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FBF9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9FBF9),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF121810), size: 28),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Green Cradle Initiative',
          style: TextStyle(
            color: const Color(0xFF121810),
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.015 * 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // "Select Your Role" Title
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 20), // px-4 pb-3 pt-5 from HTML, adjusted
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Select Your Role', // text-[#121810] tracking-light text-[28px] font-bold leading-tight
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF121810),
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                    letterSpacing: -0.025 * 28,
                  ),
                ),
              ),
            ),
            // Role Selection Options (using Wrap for flex-wrap behavior)
            Padding(
              padding: const EdgeInsets.all(16.0), // p-4 from HTML, applied to padding
              child: Wrap(
                spacing: 12.0, // gap-3 from HTML, adjusted to 12.0 for better spacing
                runSpacing: 12.0, // gap-3 from HTML, adjusted for vertical spacing
                children: [
                  _buildRoleChip('Mother', context),
                  _buildRoleChip('Health Worker', context),
                  _buildRoleChip('Government Official', context),
                  _buildRoleChip('Admin', context),
                ],
              ),
            ),
            const Spacer(), // Pushes content to the top, button to the bottom

            // Continue Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), // px-4 py-3
              child: SizedBox(
                height: 48, // h-12
                width: double.infinity, // flex-1
                child: ElevatedButton(
                  onPressed: () {
                    if (_selectedRole == 'Mother') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MotherLoginPage()),
                      );
                    } else if (_selectedRole == 'Health Worker') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HealthWorkerLoginPage()),
                      );
                    } else if (_selectedRole == 'Government Official') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GovernmentOfficialLoginPage()),
                      );
                    } else if (_selectedRole == 'Admin') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AdminLoginPage()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please select a role to continue.'),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _primaryGreen, // bg-[#8cd279] in HTML, replaced with _primaryGreen
                    foregroundColor: const Color(0xFF121810),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(999), // rounded-full
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20), // px-5
                    elevation: 0,
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 16, // text-base
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                      letterSpacing: 0.015 * 16,
                    ),
                  ),
                ),
              ),
            ),
            // Bottom Spacer
            Container(
              height: 20, // h-5
              color: const Color(0xFFF9FBF9),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleChip(String role, BuildContext context) {
    final bool isSelected = _selectedRole == role;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedRole = role;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200), // For smooth border transition
        height: 60, // Increased from 44 to 60eased from 44 to 60
        padding: isSelected
            ? const EdgeInsets.symmetric(horizontal: 24.0) // Increased horizontal padding
            : const EdgeInsets.symmetric(horizontal: 28.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20), // Increased from 12 to 20from 12 to 20
          border: Border.all(
            color: isSelected ? _primaryGreen : const Color(0xFFD7E2D4),
            width: isSelected ? 3.0 : 1.0,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          role,
          style: const TextStyle(
            color: Color(0xFF121810),
            fontSize: 18, // Increased from 14 to 18ed from 14 to 18
            fontWeight: FontWeight.w600, // Slightly bolderlder
            height: 1.5,
          ),
        ),
      ),
    );
  }
}