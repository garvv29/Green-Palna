import 'package:flutter/material.dart';
import 'package:gp1/features/government_official/local_worker/local_worker_dashboard_page.dart'; // Import the LocalWorkerDashboardPage
import 'package:gp1/features/government_official/adhikari/adhikari_dash.dart'; // Import the AdhikariDashboardPage
import '../idk/newsystem.dart';

class GovernmentOfficialLoginPage extends StatefulWidget {
  const GovernmentOfficialLoginPage({super.key});

  @override
  State<GovernmentOfficialLoginPage> createState() => _GovernmentOfficialLoginPageState();
}

class _GovernmentOfficialLoginPageState extends State<GovernmentOfficialLoginPage> {
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF121810), size: 28), // text-[#121810]
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Green Cradle Initiative',
          style: TextStyle(
            color: const Color(0xFF121810), // text-[#121810]
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
                // "Logging in as Government Official"
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 20, 16, 12), // px-4 pb-2 pt-5
                  child: Text(
                    'Logging in as Government Official',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF121810), // text-[#121810]
                      fontSize: 24, // text-2xl
                      fontWeight: FontWeight.bold, // font-bold
                      height: 1.25, // leading-tight
                      letterSpacing: -0.025 * 24, // tracking-light
                    ),
                  ),
                ),
                // "Official Login"
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 20), // pb-3 pt-5 px-4
                  child: Text(
                    'Official Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF121810), // text-[#121810]
                      fontSize: 26, // text-[22px], increased slightly for better visual hierarchy
                      fontWeight: FontWeight.bold, // font-bold
                      height: 1.25, // leading-tight
                      letterSpacing: -0.015 * 26, // tracking-[-0.015em]
                    ),
                  ),
                ),

                const SizedBox(height: 20), // Spacing before inputs

                // Username Input
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      hintText: 'Username',
                      hintStyle: const TextStyle(color: Color(0xFF668A5C)), // placeholder:text-[#668a5c]
                      filled: true,
                      fillColor: const Color(0xFFEBF1EA), // bg-[#ebf1ea]
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
                      contentPadding: const EdgeInsets.all(16), // p-4
                    ),
                    style: const TextStyle(
                      color: Color(0xFF121810), // text-[#121810]
                      fontSize: 16, // text-base
                      fontWeight: FontWeight.normal, // font-normal
                    ),
                    cursorColor: const Color(0xFF668A5C), // Placeholder color for cursor
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
                      hintStyle: const TextStyle(color: Color(0xFF668A5C)), // placeholder:text-[#668a5c]
                      filled: true,
                      fillColor: const Color(0xFFEBF1EA), // bg-[#ebf1ea]
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
                      contentPadding: const EdgeInsets.all(16), // p-4
                      suffixIcon: IconButton( // Add suffixIcon for toggle
                        icon: Icon(
                          _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                          color: const Color(0xFF668A5C), // Match placeholder color
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible; // Toggle visibility
                          });
                        },
                      ),
                    ),
                    style: const TextStyle(
                      color: Color(0xFF121810), // text-[#121810]
                      fontSize: 16, // text-base
                      fontWeight: FontWeight.normal, // font-normal
                    ),
                    cursorColor: const Color(0xFF668A5C), // Placeholder color for cursor
                  ),
                ),
                const SizedBox(height: 16), // Gap before dropdown

                // Select Role Dropdown
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Container(
                    height: 56, // h-14
                    decoration: BoxDecoration(
                      color: const Color(0xFFEBF1EA), // bg-[#ebf1ea]
                      borderRadius: BorderRadius.circular(12), // rounded-xl
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16), // p-4
                    child: DropdownButtonHideUnderline( // Hides the default underline
                      child: DropdownButton<String>(
                        value: _selectedRoleOption,
                        hint: Text(
                          'Select Role',
                          style: TextStyle(
                            color: const Color(0xFF668A5C), // placeholder:text-[#668a5c]
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        icon: Icon(
                          Icons.arrow_drop_down, // Default dropdown arrow icon
                          color: const Color(0xFF668A5C), // From --select-button-svg fill
                          size: 28, // Adjusted size to be prominent
                        ),
                        isExpanded: true, // Make dropdown take full width
                        dropdownColor: const Color(0xFFEBF1EA), // Background color of the dropdown menu
                        style: const TextStyle(
                          color: Color(0xFF121810), // text-[#121810]
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                        items: const [
                          DropdownMenuItem(value: 'local_worker', child: Text('Local Worker')), // Updated label
                          DropdownMenuItem(value: 'official', child: Text('Official')), // Updated value
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
                  alignment: Alignment.center, // text-center in HTML
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 20), // pb-3 pt-1 px-4
                    child: GestureDetector(
                      onTap: () {
                        // Handle forgot password tap
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
                          color: const Color(0xFF668A5C), // text-[#668a5c]
                          fontSize: 14, // text-sm
                          fontWeight: FontWeight.normal, // font-normal
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(), // Pushes content to the top, buttons to the bottom

                // Login Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10), // Adjusted vertical padding
                  child: SizedBox(
                    height: 48, // h-12
                    width: double.infinity, // flex-1
                    child: ElevatedButton(
                      onPressed: () {
                        if (_selectedRoleOption == 'local_worker') { // Check if 'local_worker' is selected
                          // Navigate to LocalWorkerDashboardPage if 'Local Worker' is selected
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LocalWorkerDashboardPage(),
                            ),
                          );
                        } else if (_selectedRoleOption == 'official') { // Check if 'official' is selected
                          // Navigate to AdhikariDashboardPage if 'Official' is selected
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AdhikariDashboardPage(),
                            ),
                          );
                        } else {
                          // If no option is selected, prompt the user
                          ScaffoldMessenger.of(context).showSnackBar(
                                                      const SnackBar(
                            content: Text('Please select a role option (Local Worker or Official).'),
                            duration: Duration(seconds: 2),
                          ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF50D22C), // Updated green color from 0xFF8CD279
                        foregroundColor: const Color(0xFF121810), // text-[#121810]
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(999), // rounded-full
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

                // New User Registration Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LocalWorkerProfileFormScreen(
                              headerTitle: 'Government Official Registration',
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF50D22C),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(999),
                          side: const BorderSide(color: Color(0xFF50D22C), width: 2),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        elevation: 0,
                      ),
                      child: const Text(
                        'New User? Register',
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
                const SizedBox(height: 20), // Equivalent to div class="h-5"
              ],
            ),
          ),
        ),
      ),
    );
  }
}