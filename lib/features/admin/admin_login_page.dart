import 'package:flutter/material.dart';
import 'admin_dashboard_page.dart';

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({super.key});

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false; // New state variable for password visibility

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FBF9), // bg-[#f9fbf9]
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9FBF9),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF111A0F), size: 28),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Green Cradle Initiative', // From HTML header
          style: TextStyle(
            color: const Color(0xFF111A0F), // text-[#111a0f]
            fontSize: 20, // text-lg, adjusted for AppBar consistency
            fontWeight: FontWeight.bold,
            letterSpacing: -0.015 * 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: IntrinsicHeight(
            child: Column(
              children: [
                // "Logging in as Admin"
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 20, 16, 30), // px-4 pb-3 pt-5 from HTML, adjusted for spacing
                  child: Text(
                    'Logging in as Admin',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF111A0F), // text-[#111a0f]
                      fontSize: 32, // text-[28px] from HTML, increased for better visibility
                      fontWeight: FontWeight.bold, // font-bold
                      height: 1.25, // leading-tight
                      letterSpacing: -0.025 * 32, // tracking-light
                    ),
                  ),
                ),

                // Username Input
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8), // Adjusted from px-4 py-3 gap-4
                  child: TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      hintText: 'Username',
                      hintStyle: const TextStyle(color: Color(0xFF629155)),
                      filled: true,
                      fillColor: const Color(0xFFEBF2E9),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.all(16),
                    ),
                    style: const TextStyle(
                      color: Color(0xFF111A0F),
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                    cursorColor: const Color(0xFF629155),
                  ),
                ),
                const SizedBox(height: 16), // Gap between inputs

                // Password Input with Visibility Toggle
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible, // Use the state variable
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: const TextStyle(color: Color(0xFF629155)),
                      filled: true,
                      fillColor: const Color(0xFFEBF2E9),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.all(16),
                      suffixIcon: IconButton( // Add suffixIcon for toggle
                        icon: Icon(
                          _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                          color: const Color(0xFF629155), // Match placeholder color
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible; // Toggle visibility
                          });
                        },
                      ),
                    ),
                    style: const TextStyle(
                      color: Color(0xFF111A0F),
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                    cursorColor: const Color(0xFF629155),
                  ),
                ),

                const Spacer(),

                // Login Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const AdminDashboardPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF50D22C), // Updated green color
                        foregroundColor: const Color(0xFF111A0F),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(999),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                          letterSpacing: 0.015 * 16,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}