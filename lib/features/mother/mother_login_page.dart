import 'package:flutter/material.dart';
import 'mother_dash.dart';

class MotherLoginPage extends StatefulWidget {
  const MotherLoginPage({super.key});

  @override
  State<MotherLoginPage> createState() => _MotherLoginPageState();
}

class _MotherLoginPageState extends State<MotherLoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false; // New state variable for password visibility

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(_updateButtonState);
    _passwordController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    setState(() {
      // This will trigger a rebuild when text changes
    });
  }

  @override
  void dispose() {
    _usernameController.removeListener(_updateButtonState);
    _passwordController.removeListener(_updateButtonState);
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
        automaticallyImplyLeading: false,
        title: Text(
          'Green Palna',
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: IntrinsicHeight(
            child: Column(
              children: [
                // "Logging in as Mother"
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
                  child: Text(
                    'Logging in as Mother',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF121810),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      height: 1.25,
                      letterSpacing: -0.025 * 24,
                    ),
                  ),
                ),
                // "Mother Login"
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
                  child: Text(
                    'Mother Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF121810),
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
                      hintStyle: const TextStyle(color: Colors.black54),
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
                    cursorColor: Colors.black,
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
                      hintStyle: const TextStyle(color: Colors.black54),
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
                          color: Colors.black, // Match placeholder color
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
                    cursorColor: Colors.black,
                  ),
                ),

                // Forgot Password?
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            final TextEditingController emailController = TextEditingController();
                            return AlertDialog(
                              title: const Text('Forgot Password', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text('Please enter your email address:', style: TextStyle(fontSize: 16)),
                                  const SizedBox(height: 12),
                                  TextField(
                                    controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    style: const TextStyle(fontSize: 16),
                                    decoration: const InputDecoration(
                                      hintText: 'Email',
                                      hintStyle: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.of(context).pop(),
                                      child: const Text('Cancel', style: TextStyle(fontSize: 16)),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        final email = emailController.text.trim();
                                        Navigator.of(context).pop();
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: const Text('Password Reset', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                            content: Text(
                                              'Password has been sent to $email.',
                                              style: const TextStyle(fontSize: 16),
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.of(context).pop(),
                                                child: const Text('OK', style: TextStyle(fontSize: 16)),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      child: const Text('Send', style: TextStyle(fontSize: 16)),
                                    ),
                                  ],
                                );
                          },
                        );
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.black,
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
                      onPressed: (_usernameController.text.isNotEmpty && _passwordController.text.isNotEmpty) ? () {
                        debugPrint('Mother Username: ${_usernameController.text}');
                        debugPrint('Mother Password: ${_passwordController.text}');
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => const MotherDashboard()),
                        );
                      } : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: (_usernameController.text.isNotEmpty && _passwordController.text.isNotEmpty) 
                            ? const Color(0xFF34A853) 
                            : const Color(0xFFE8F2EC),
                        foregroundColor: (_usernameController.text.isNotEmpty && _passwordController.text.isNotEmpty) 
                            ? Colors.white 
                            : const Color(0xFF6B7A6B),
                        disabledBackgroundColor: const Color(0xFFE8F2EC),
                        disabledForegroundColor: const Color(0xFF6B7A6B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(999),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        elevation: (_usernameController.text.isNotEmpty && _passwordController.text.isNotEmpty) ? 2 : 0,
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