import 'package:flutter/material.dart';
import 'nursedash.dart';

class HealthWorkerLoginPage extends StatefulWidget {
  const HealthWorkerLoginPage({super.key});

  @override
  State<HealthWorkerLoginPage> createState() => _HealthWorkerLoginPageState();
}

class _HealthWorkerLoginPageState extends State<HealthWorkerLoginPage> {
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
      backgroundColor: const Color(0xFFF9FBF9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9FBF9),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF111A0F), size: 28),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Green Cradle Initiative',
          style: TextStyle(
            color: const Color(0xFF111A0F),
            fontSize: 20,
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
                // "Logging in as Health Worker"
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
                  child: Text(
                    'Logging in as Health Worker',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF111A0F),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      height: 1.25,
                      letterSpacing: -0.025 * 24,
                    ),
                  ),
                ),
                // "Health Worker Login"
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
                  child: Text(
                    'Health Worker Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF111A0F),
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      height: 1.25,
                      letterSpacing: -0.015 * 26,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Username Input
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
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
                const SizedBox(height: 16),

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

                // Forgot Password?
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
                    child: GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Forgot Password? functionality not implemented.'),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: const Color(0xFF629155),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),

                // Login Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        debugPrint('Health Worker Username: ${_usernameController.text}');
                        debugPrint('Health Worker Password: ${_passwordController.text}');
                        // Navigate to nurse dashboard
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const DashboardScreen(),
                          ),
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

                // "New Health Worker? Register"
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
                    child: GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Health Worker Registration functionality not implemented.'),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      },
                      child: Text(
                        'New Health Worker? Register',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFF629155),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.underline,
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