import 'package:flutter/material.dart';
import '../../admin/totaldel.dart';
import '../../admin/misseddeadlines.dart';
import '../../admin/notifications_page.dart';
import '../../admin/sapling_distribution_ui.dart';

class AdhikariDashboardPage extends StatefulWidget {
  const AdhikariDashboardPage({super.key});

  @override
  State<AdhikariDashboardPage> createState() => _AdhikariDashboardPageState();
}

class _AdhikariDashboardPageState extends State<AdhikariDashboardPage> {
  // Set initial selected index to 0 for Home tab
  int _selectedIndex = 0; // 0: Home, 1: Workers

  // Dummy data for dropdowns and workers
  final List<String> _districts = [
    'Raipur', 'Bilaspur', 'Durg', 'Bhilai', 'Korba', 'Jagdalpur', 
    'Ambikapur', 'Rajnandgaon', 'Mahasamund', 'Balodabazar', 'Gariaband',
  ];
  final List<String> _subdivisions = [
    'Raipur', 'Abhanpur', 'Tilda', 'Bilaspur', 'Masturi', 'Takhatpur',
    'Durg', 'Patan', 'Gunderdehi', 'Bhilai', 'Dhamdha', 'Balod',
  ];
  final List<String> _tehsils = [
    'Raipur', 'Abhanpur', 'Tilda', 'Bilaspur', 'Masturi', 'Takhatpur',
    'Durg', 'Patan', 'Gunderdehi', 'Bhilai', 'Dhamdha', 'Balod',
  ];
  final List<String> _panchayats = [
    
    'Kanker', 'Charama', 'Narharpur', 'Kondagaon', 'Keshkal', 'Makdi',
    'Narayanpur', 'Orchha', 'Bastar', 'Bakavand', 'Tokapal', 'Bhanpuri',
  ];

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
            // Notification icon in top right
            IconButton(
              icon: Icon(Icons.notifications, color: darkTextColor, size: 28),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NotificationsPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          // HOME TAB (Adhikari Dashboard Overview)
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
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const TotalDeliveriesPage()),
                      );
                    },
                    child: _buildStatCard(
                      title: 'Total Deliveries',
                      value: '5,678',
                      icon: Icons.park_rounded,
                      gradient: const LinearGradient(
                        colors: [Color(0xFF50D22C), Color(0xFF7BE495)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      darkTextColor: darkTextColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PlantDistributionPage()),
                      );
                    },
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
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MissedDeadlinesPage()),
                      );
                    },
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
                      'Search Mitanin',
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
                  // Local Mitanin Section Title
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
                    child: Text(
                      'Local Mitanin',
                      style: TextStyle(
                        color: darkTextColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.015 * 22,
                      ),
                    ),
                  ),
                  // Local Mitanin List Items (same avatars as employees)
                  _buildLocalWorkerItem(
                    imageUrl: 'https://cdn.pixabay.com/photo/2015/03/04/22/35/avatar-659652_1280.png',
                    name: 'Kavita Devi',
                    number: '9876543210',
                    address: '12 Lotus Colony, Raipur',
                    pendingWork: 3,
                    darkTextColor: darkTextColor,
                    secondaryTextColor: secondaryTextColor,
                  ),
                  _buildLocalWorkerItem(
                    imageUrl: 'https://cdn.pixabay.com/photo/2017/03/01/22/01/avatar-2109968_1280.png',
                    name: 'Sunita Kumari',
                    number: '9123456780',
                    address: '45 MG Road, Bilaspur',
                    pendingWork: 2,
                    darkTextColor: darkTextColor,
                    secondaryTextColor: secondaryTextColor,
                  ),
                  _buildLocalWorkerItem(
                    imageUrl: 'https://cdn.pixabay.com/photo/2017/01/31/13/41/avatar-2024765_1280.png',
                    name: 'Priya Sharma',
                    number: '9988776655',
                    address: '78 Nehru Street, Durg',
                    pendingWork: 1,
                    darkTextColor: darkTextColor,
                    secondaryTextColor: secondaryTextColor,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
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
              label: 'Mitanin',
              color: _selectedIndex == 1 ? darkTextColor : secondaryTextColor,
              isActive: _selectedIndex == 1,
              onTap: () => setState(() => _selectedIndex = 1),
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
        return 'Adhikari Dashboard';
      case 1:
        return 'Mitanin';
      default:
        return 'Adhikari Dashboard';
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
