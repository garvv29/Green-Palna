import 'package:flutter/material.dart';

class AdminDashboardPage extends StatefulWidget {
  const AdminDashboardPage({super.key});

  @override
  State<AdminDashboardPage> createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage> {
  // Set initial selected index to 0 for Home tab
  int _selectedIndex = 0; // 0: Home, 1: Workers, 2: Notifications

  // Dummy data for dropdowns and workers
  final List<String> _districts = ['Raipur', 'Bhilai', 'Balodabazar', 'Daldo'];
  final List<String> _subdivisions = ['One', 'Two', 'Three'];
  final List<String> _tehsils = ['One', 'Two', 'Three'];
  final List<String> _panchayats = ['One', 'Two', 'Three'];

  // Selected values for dropdowns
  String? _selectedDistrict;
  String? _selectedSubdivision;
  String? _selectedTehsil;
  String? _selectedPanchayat;

  @override
  Widget build(BuildContext context) {
    const Color backgroundColor = Color(0xFFF9FBF9);
    const Color darkTextColor = Color(0xFF121810);
    const Color lightBorderColor = Color(0xFFD7E2D4);
    const Color buttonGreen = Color(0xFF8CD279);
    const Color secondaryTextColor = Color(0xFF668A5C);

    // Colors specific to Notifications content
    const Color notificationBgColor = Color(0xFFFCF8F8); // bg-[#fcf8f8]
    const Color primaryRedText = Color(0xFFCC0000); // More intense red for "Task overdue" and time
    const Color notificationIconBgRed = Color(0xFFE05252); // Darker red for notification icon background
    const Color navBarBorderColor = Color(0xFFEBF1EA); // border-[#ebf1ea] - from your provided code

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            // Back arrow icon (always visible, top left)
            IconButton(
              icon: const Icon(Icons.arrow_back, color: darkTextColor, size: 28),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Expanded(
              child: Text(
                _getAppBarTitle(_selectedIndex), // Dynamic title based on selected tab
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: darkTextColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.015 * 20,
                ),
              ),
            ),
            const SizedBox(width: 48), // To balance the back button space
          ],
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          // HOME TAB (Admin Dashboard Overview)
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Overview Section Title
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
                  child: Text(
                    'Overview',
                    style: TextStyle(
                      color: darkTextColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.015 * 22,
                    ),
                  ),
                ),
                // Statistic Cards Section - Now each card is a full-width block
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: _buildStatCard(
                    title: 'Total Deliveries',
                    value: '1,234',
                    icon: Icons.park_rounded,
                    gradient: const LinearGradient(
                      colors: [Color(0xFF50D22C), Color(0xFF7BE495)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    darkTextColor: darkTextColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: _buildStatCard(
                    title: 'Saplings Distributed',
                    value: '1,234',
                    icon: Icons.park_rounded,
                    gradient: const LinearGradient(
                      colors: [Color(0xFF50D22C), Color(0xFFB6FFCE)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    darkTextColor: darkTextColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: _buildStatCard(
                    title: 'Missed Deadlines',
                    value: '123',
                    icon: Icons.warning_amber_rounded,
                    gradient: const LinearGradient(
                      colors: [Color(0xFFE53935), Color(0xFFFFA8A8)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    darkTextColor: darkTextColor,
                  ),
                ),
                // Create Profile Button
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle create new profile action
                        debugPrint('Create New Profile tapped!');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonGreen,
                        foregroundColor: darkTextColor,
                        minimumSize: const Size.fromHeight(40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(999),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Create New Profile',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.015 * 14,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          // WORKERS TAB
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Search Section Title
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
                    child: Text(
                      'Search Workers',
                      style: TextStyle(
                        color: darkTextColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.015 * 22,
                      ),
                    ),
                  ),
                  // Dropdown Filters
                  _buildDropdownFilter(
                    label: 'District',
                    options: _districts,
                    value: _selectedDistrict,
                    onChanged: (val) => setState(() => _selectedDistrict = val),
                    darkTextColor: darkTextColor,
                    secondaryTextColor: secondaryTextColor,
                    borderColor: lightBorderColor,
                    backgroundColor: backgroundColor,
                  ),
                  _buildDropdownFilter(
                    label: 'Subdivision',
                    options: _subdivisions,
                    value: _selectedSubdivision,
                    onChanged: (val) => setState(() => _selectedSubdivision = val),
                    darkTextColor: darkTextColor,
                    secondaryTextColor: secondaryTextColor,
                    borderColor: lightBorderColor,
                    backgroundColor: backgroundColor,
                  ),
                  _buildDropdownFilter(
                    label: 'Tehsil/Block',
                    options: _tehsils,
                    value: _selectedTehsil,
                    onChanged: (val) => setState(() => _selectedTehsil = val),
                    darkTextColor: darkTextColor,
                    secondaryTextColor: secondaryTextColor,
                    borderColor: lightBorderColor,
                    backgroundColor: backgroundColor,
                  ),
                  _buildDropdownFilter(
                    label: 'Panchayat/Block',
                    options: _panchayats,
                    value: _selectedPanchayat,
                    onChanged: (val) => setState(() => _selectedPanchayat = val),
                    darkTextColor: darkTextColor,
                    secondaryTextColor: secondaryTextColor,
                    borderColor: lightBorderColor,
                    backgroundColor: backgroundColor,
                  ),
                  // Local Workers Section Title
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
                    child: Text(
                      'Local Workers',
                      style: TextStyle(
                        color: darkTextColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.015 * 22,
                      ),
                    ),
                  ),
                  // Local Worker List Items (same avatars as employees)
                  _buildLocalWorkerItem(
                    imageUrl: 'https://cdn.pixabay.com/photo/2015/03/04/22/35/avatar-659652_1280.png',
                    name: 'Ravi Kumar',
                    number: '9876543210',
                    address: '12 Lotus Colony, Delhi',
                    pendingWork: 3,
                    darkTextColor: darkTextColor,
                    secondaryTextColor: secondaryTextColor,
                  ),
                  _buildLocalWorkerItem(
                    imageUrl: 'https://cdn.pixabay.com/photo/2017/03/01/22/01/avatar-2109968_1280.png',
                    name: 'Suman Joshi',
                    number: '9123456780',
                    address: '45 MG Road, Mumbai',
                    pendingWork: 2,
                    darkTextColor: darkTextColor,
                    secondaryTextColor: secondaryTextColor,
                  ),
                  _buildLocalWorkerItem(
                    imageUrl: 'https://cdn.pixabay.com/photo/2017/01/31/13/41/avatar-2024765_1280.png',
                    name: 'Priya Singh',
                    number: '9988776655',
                    address: '78 Nehru Street, Lucknow',
                    pendingWork: 1,
                    darkTextColor: darkTextColor,
                    secondaryTextColor: secondaryTextColor,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          // NOTIFICATIONS TAB (Mother sapling photo uploads left)
          SingleChildScrollView(
            child: Column(
              children: [
                _buildNotificationItem(
                  title: 'Anjali Patel: 1 sapling photo left to upload',
                  subtitle: 'Upload pending',
                  time: 'Overdue by 1 day',
                  darkTextColor: darkTextColor,
                  primaryRedText: primaryRedText,
                  notificationIconBgRed: notificationIconBgRed,
                  icon: Icons.park_rounded,
                  imageUrl: 'https://cdn.pixabay.com/photo/2015/03/04/22/35/avatar-659652_1280.png',
                ),
                _buildNotificationItem(
                  title: 'Priya Sharma: 2 sapling photos left to upload',
                  subtitle: 'Upload pending',
                  time: 'Overdue by 3 days',
                  darkTextColor: darkTextColor,
                  primaryRedText: primaryRedText,
                  notificationIconBgRed: notificationIconBgRed,
                  icon: Icons.park_rounded,
                  imageUrl: 'https://cdn.pixabay.com/photo/2015/03/04/22/35/avatar-659652_1280.png',
                ),
                _buildNotificationItem(
                  title: 'Meera Nair: 3 sapling photos left to upload',
                  subtitle: 'Upload pending',
                  time: 'Overdue by 5 days',
                  darkTextColor: darkTextColor,
                  primaryRedText: primaryRedText,
                  notificationIconBgRed: notificationIconBgRed,
                  icon: Icons.park_rounded,
                  imageUrl: 'https://cdn.pixabay.com/photo/2017/03/01/22/01/avatar-2109968_1280.png',
                ),
                _buildNotificationItem(
                  title: 'Sunita Reddy: 2 sapling photos left to upload',
                  subtitle: 'Upload pending',
                  time: 'Overdue by 7 days',
                  darkTextColor: darkTextColor,
                  primaryRedText: primaryRedText,
                  notificationIconBgRed: notificationIconBgRed,
                  icon: Icons.park_rounded,
                  imageUrl: 'https://randomuser.me/api/portraits/women/65.jpg',
                ),
                _buildNotificationItem(
                  title: 'Kavita Singh: 4 sapling photos left to upload',
                  subtitle: 'Upload pending',
                  time: 'Overdue by 9 days',
                  darkTextColor: darkTextColor,
                  primaryRedText: primaryRedText,
                  notificationIconBgRed: notificationIconBgRed,
                  icon: Icons.park_rounded,
                  imageUrl: 'https://cdn.pixabay.com/photo/2017/01/31/13/41/avatar-2024765_1280.png',
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border(
            top: BorderSide(color: navBarBorderColor, width: 1.0),
          ),
        ),
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildBottomNavItem(
              icon: Icons.home_filled,
              label: 'Home',
              color: _selectedIndex == 0 ? darkTextColor : secondaryTextColor,
              isActive: _selectedIndex == 0,
              onTap: () => setState(() => _selectedIndex = 0),
            ),
            _buildBottomNavItem(
              icon: Icons.groups,
              label: 'Workers',
              color: _selectedIndex == 1 ? darkTextColor : secondaryTextColor,
              isActive: _selectedIndex == 1,
              onTap: () => setState(() => _selectedIndex = 1),
            ),
            _buildBottomNavItem(
              icon: Icons.notifications,
              label: 'Notifications',
              color: _selectedIndex == 2 ? darkTextColor : secondaryTextColor,
              isActive: _selectedIndex == 2,
              onTap: () => setState(() => _selectedIndex = 2),
            ),
          ],
        ),
      ),
    );
  }

  // Helper to get AppBar title based on selected index
  String _getAppBarTitle(int index) {
    switch (index) {
      case 0:
        return 'Admin Dashboard';
      case 1:
        return 'Workers';
      case 2:
        return 'Notifications';
      default:
        return 'Admin Dashboard';
    }
  }

  // Widget for Statistic Cards
  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    required LinearGradient gradient,
    required Color darkTextColor,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: gradient,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                ),
              ),
              Icon(
                icon,
                color: Colors.white,
                size: 24,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.02 * 24,
              height: 1.25,
            ),
          ),
        ],
      ),
    );
  }

  // Widget for Dropdown Filter
  Widget _buildDropdownFilter({
    required String label,
    required List<String> options,
    required String? value,
    required void Function(String?) onChanged,
    required Color darkTextColor,
    required Color secondaryTextColor,
    required Color borderColor,
    required Color backgroundColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: borderColor),
              color: backgroundColor,
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  border: InputBorder.none,
                  hintText: label,
                  hintStyle: TextStyle(color: secondaryTextColor),
                ),
                isExpanded: true,
                icon: Icon(Icons.arrow_drop_down, color: secondaryTextColor),
                value: value,
                style: TextStyle(
                  color: darkTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  height: 1.5,
                ),
                onChanged: onChanged,
                items: options.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget for Local Worker List Item
  Widget _buildLocalWorkerItem({
    required String imageUrl,
    required String name,
    required String number,
    required String address,
    required int pendingWork,
    required Color darkTextColor,
    required Color secondaryTextColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(imageUrl),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: darkTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
                ),
                Text(
                  'Number: $number',
                  style: TextStyle(
                    color: secondaryTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    height: 1.5,
                  ),
                ),
                Text(
                  'Address: $address',
                  style: TextStyle(
                    color: secondaryTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    height: 1.5,
                  ),
                ),
                Text(
                  'Pending Work: $pendingWork',
                  style: TextStyle(
                    color: secondaryTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget to build individual notification items
  Widget _buildNotificationItem({
    required String title,
    required String subtitle,
    required String time,
    required Color darkTextColor,
    required Color primaryRedText,
    required Color notificationIconBgRed,
    IconData? icon,
    String? imageUrl,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Avatar or Icon Container
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: notificationIconBgRed,
              borderRadius: BorderRadius.circular(8),
              image: imageUrl != null
                  ? DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: imageUrl == null && icon != null
                ? Icon(
                    icon,
                    color: Colors.white,
                    size: 24,
                  )
                : null,
          ),
          const SizedBox(width: 16),
          // Text Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  // Show full text, no ellipsis or maxLines
                  style: TextStyle(
                    color: darkTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
                ),
                Text(
                  subtitle,
                  // Show full text, no ellipsis or maxLines
                  style: TextStyle(
                    color: primaryRedText,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          // Time
          Text(
            time,
            style: TextStyle(
              color: primaryRedText,
              fontSize: 14,
              fontWeight: FontWeight.normal,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  // Widget for Bottom Navigation Bar items
  Widget _buildBottomNavItem({
    required IconData icon,
    required String label,
    required Color color,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        customBorder: const StadiumBorder(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: color,
                size: 28,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  color: color,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                  letterSpacing: 0.015 * 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}