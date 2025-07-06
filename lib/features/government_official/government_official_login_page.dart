import 'package:flutter/material.dart';
import 'package:gp1/features/government_official/local_worker/local_worker_dashboard_page.dart'; // Import the LocalWorkerDashboardPage
import 'hospital.dart';

class GovernmentOfficialLoginPage extends StatefulWidget {
  const GovernmentOfficialLoginPage({super.key});

  @override
  State<GovernmentOfficialLoginPage> createState() =>
      _GovernmentOfficialLoginPageState();
}

class _GovernmentOfficialLoginPageState
    extends State<GovernmentOfficialLoginPage> {
  bool get _isLoginEnabled =>
      _usernameController.text.trim().isNotEmpty &&
      _passwordController.text.trim().isNotEmpty;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // Using more descriptive string values for clarity
  String? _selectedRoleOption; // This will hold 'local_worker' or 'official'
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
        automaticallyImplyLeading: false,
        title: Text(
          'Green Palna',
          style: TextStyle(
            color: const Color(0xFF121810), // text-[#121810]
            fontSize: MediaQuery.of(context).size.width * 0.05,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.04),
          child: StatefulBuilder(
            builder: (context, setStateSB) {
              return Column(
                children: [
                  // "Logging in as Government Official"
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.04,
                      MediaQuery.of(context).size.height * 0.02,
                      MediaQuery.of(context).size.width * 0.04,
                      MediaQuery.of(context).size.height * 0.01,
                    ),
                    child: Text(
                      'Logging in as Government Official',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF121810),
                        fontSize: MediaQuery.of(context).size.width * 0.06, // Responsive font size
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                  ),
                  // "Official Login"
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.04,
                      MediaQuery.of(context).size.height * 0.01,
                      MediaQuery.of(context).size.width * 0.04,
                      MediaQuery.of(context).size.height * 0.02,
                    ),
                    child: Text(
                      'Official Login',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF121810),
                        fontSize: MediaQuery.of(context).size.width * 0.065, // Responsive font size
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02), // Responsive spacing
                  // Username Input
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.01),
                    child: TextField(
                      controller: _usernameController,
                      onChanged: (_) => setStateSB(() {}),
                      decoration: InputDecoration(
                        hintText: 'Username',
                        hintStyle: const TextStyle(
                          color: Color(0xFF668A5C),
                        ),
                        filled: true,
                        fillColor: const Color(0xFFEBF1EA),
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
                        contentPadding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                      ),
                      style: TextStyle(
                        color: const Color(0xFF121810),
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        fontWeight: FontWeight.normal,
                      ),
                      cursorColor: const Color(0xFF668A5C),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.015), // Responsive gap
                  // Password Input with Visibility Toggle
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.01),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: !_isPasswordVisible,
                      onChanged: (_) => setStateSB(() {}),
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: const TextStyle(
                          color: Color(0xFF668A5C),
                        ),
                        filled: true,
                        fillColor: const Color(0xFFEBF1EA),
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
                        contentPadding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setStateSB(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                      ),
                      style: TextStyle(
                        color: const Color(0xFF121810),
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        fontWeight: FontWeight.normal,
                      ),
                      cursorColor: const Color(0xFF668A5C),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.015), // Responsive gap
                  // Select Role Dropdown
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.01),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.07, // Responsive height
                      decoration: BoxDecoration(
                        color: const Color(0xFFEBF1EA),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.04,
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedRoleOption,
                          hint: Text(
                            'Select Role',
                            style: TextStyle(
                              color: const Color(0xFF668A5C),
                              fontSize: MediaQuery.of(context).size.width * 0.04,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: const Color(0xFF668A5C),
                            size: MediaQuery.of(context).size.width * 0.07,
                          ),
                          isExpanded: true,
                          dropdownColor: const Color(0xFFEBF1EA),
                          style: TextStyle(
                            color: const Color(0xFF121810),
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontWeight: FontWeight.normal,
                          ),
                          items: const [
                            DropdownMenuItem(
                              value: 'local_worker',
                              child: Text('Local Worker'),
                            ),
                            DropdownMenuItem(
                              value: 'official',
                              child: Text('Official'),
                            ),
                            DropdownMenuItem(
                              value: 'hospital',
                              child: Text('Hospital'),
                            ),
                          ],
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedRoleOption = newValue;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  // Forgot Password?
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.04,
                        MediaQuery.of(context).size.height * 0.01,
                        MediaQuery.of(context).size.width * 0.04,
                        MediaQuery.of(context).size.height * 0.02,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Forgot Password? functionality not implemented.',
                              ),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: const Color(0xFF668A5C),
                            fontSize: MediaQuery.of(context).size.width * 0.035,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05), // Responsive spacing
                  // Login Button
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.04,
                      vertical: MediaQuery.of(context).size.height * 0.01,
                    ),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06, // Responsive height
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _isLoginEnabled
                            ? () {
                                if (_selectedRoleOption == 'local_worker') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const LocalWorkerDashboardPage(),
                                    ),
                                  );
                                } else if (_selectedRoleOption == 'official') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Official dashboard not implemented.',
                                      ),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                } else if (_selectedRoleOption == 'hospital') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          HospitalDashboard(),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Please select a role option (Local Worker, Official, or Hospital).',
                                      ),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                }
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF50D22C),
                          foregroundColor: const Color(0xFF121810),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(999),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * 0.05,
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontWeight: FontWeight.bold,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02), // Responsive spacing
                ],
              );
            },
          ), // End of StatefulBuilder
        ), // End of SingleChildScrollView
      ), // End of SafeArea
    );
  }
}
