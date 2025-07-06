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
  String? _selectedRole = null; // No initial selection

  // Define the new green color for consistency, as per your latest instruction
  static const Color _primaryGreen = Color(0xFF34A853);

  @override
  Widget build(BuildContext context) {
    final roles = [
      {'label': 'Mother', 'icon': Icons.pregnant_woman},
      {'label': 'Health Worker', 'icon': Icons.medical_services},
      {'label': 'Government Official', 'icon': Icons.account_balance},
      {'label': 'Admin', 'icon': Icons.admin_panel_settings},
    ];
    return Scaffold(
      backgroundColor: const Color(0xFFF9FBF9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9FBF9),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Green Palna',
          style: TextStyle(
            color: const Color(0xFF121810),
            fontSize: MediaQuery.of(context).size.width * 0.06,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.04,
                MediaQuery.of(context).size.height * 0.04,
                MediaQuery.of(context).size.width * 0.04,
                MediaQuery.of(context).size.height * 0.03,
              ),
              child: Text(
                'Select Your Role',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF121810),
                  fontSize: MediaQuery.of(context).size.width * 0.08,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.04),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: _buildRoleCard(roles[0]['label'] as String, roles[0]['icon'] as IconData, context)),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                      Expanded(child: _buildRoleCard(roles[1]['label'] as String, roles[1]['icon'] as IconData, context)),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Row(
                    children: [
                      Expanded(child: _buildRoleCard(roles[2]['label'] as String, roles[2]['icon'] as IconData, context)),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                      Expanded(child: _buildRoleCard(roles[3]['label'] as String, roles[3]['icon'] as IconData, context)),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.08,
                vertical: MediaQuery.of(context).size.height * 0.02,
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _selectedRole == null ? null : () {
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
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedRole == null ? const Color(0xFFE8F2EC) : _primaryGreen,
                    foregroundColor: _selectedRole == null ? const Color(0xFF6B7A6B) : Colors.white,
                    disabledBackgroundColor: const Color(0xFFE8F2EC),
                    disabledForegroundColor: const Color(0xFF6B7A6B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(999),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
                    elevation: _selectedRole == null ? 0 : 2,
                  ),
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleCard(String role, IconData icon, BuildContext context) {
    final bool isSelected = _selectedRole == role;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedRole = role;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: MediaQuery.of(context).size.height * 0.25,
        margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.01),
        decoration: BoxDecoration(
          color: isSelected ? _primaryGreen : Colors.white,
          borderRadius: BorderRadius.circular(32),
          border: Border.all(
            color: isSelected ? _primaryGreen : const Color(0xFFD7E2D4),
            width: isSelected ? 3.0 : 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: isSelected ? _primaryGreen.withOpacity(0.25) : const Color(0xFF000000).withOpacity(0.08),
              blurRadius: isSelected ? 16 : 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon, 
                size: MediaQuery.of(context).size.width * 0.18, 
                color: isSelected ? Colors.white : _primaryGreen
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Text(
                role,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isSelected ? Colors.white : const Color(0xFF121810),
                  fontSize: MediaQuery.of(context).size.width * 0.07,
                  fontWeight: FontWeight.w600,
                  height: 1.1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}