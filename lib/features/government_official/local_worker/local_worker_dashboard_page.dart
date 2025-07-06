import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'assigned.dart';
import 'profile.dart';
import 'mother_visit_page.dart';

class LocalWorkerDashboardPage extends StatefulWidget {
  const LocalWorkerDashboardPage({super.key});

  @override
  State<LocalWorkerDashboardPage> createState() => _LocalWorkerDashboardPageState();
}

class _LocalWorkerDashboardPageState extends State<LocalWorkerDashboardPage> {
  final TextEditingController searchController = TextEditingController();
  String searchQuery = '';
  int _selectedIndex = 0;

  List<Map<String, String>> assignedMothers = [
    {
      'name': 'Ananya Verma',
      'id': 'MTN001',
      'photoStatus': 'Uploaded & Verified',
      'photoStatusColor': '0xFF22C55E',
      'photoStatusBg': '0xFFD1FAE5',
      'icon': 'check_circle',
      'iconColor': '0xFF22C55E',
      'phone': '9876543210',
      'address': '123 Green Street, Raipur',
    },
    {
      'name': 'Riya Kapoor',
      'id': 'MTN002',
      'photoStatus': 'Upload Pending',
      'photoStatusColor': '0xFFD32F2F',
      'photoStatusBg': '0xFFFEE2E2',
      'icon': 'error',
      'iconColor': '0xFFD32F2F',
      'phone': '9123456780',
      'address': '45 Blue Avenue, Bilaspur',
    },
    {
      'name': 'Saanvi Mishra',
      'id': 'MTN003',
      'photoStatus': 'Uploaded & Verified',
      'photoStatusColor': '0xFF22C55E',
      'photoStatusBg': '0xFFD1FAE5',
      'icon': 'check_circle',
      'iconColor': '0xFF22C55E',
      'phone': '9988776655',
      'address': '78 Lake Road, Durg',
    },
    {
      'name': 'Priya Singh',
      'id': 'MTN004',
      'photoStatus': 'Uploaded & Verified',
      'photoStatusColor': '0xFF22C55E',
      'photoStatusBg': '0xFFD1FAE5',
      'icon': 'check_circle',
      'iconColor': '0xFF22C55E',
      'phone': '9001122334',
      'address': '12 Hill View, Bhilai',
    },
    {
      'name': 'Meera Joshi',
      'id': 'MTN005',
      'photoStatus': 'Geotagging Incorrect',
      'photoStatusColor': '0xFFD32F2F',
      'photoStatusBg': '0xFFFEE2E2',
      'icon': 'error',
      'iconColor': '0xFFD32F2F',
      'phone': '9011223344',
      'address': '56 River Lane, Korba',
    },
  ];
  int mothersAssigned = 15;
  String profileName = 'Dr. Anya Sharma';
  List<Map<String, String>> mothersList = [
    {'name': 'Sonal Verma', 'village': 'Rampur'},
    {'name': 'Meena Kumari', 'village': 'Lakshmipur'},
    {'name': 'Ritu Singh', 'village': 'Basantpur'},
    {'name': 'Anjali Yadav', 'village': 'Gopalganj'},
    {'name': 'Priyanka Sahu', 'village': 'Rajapur'},
  ];

  @override
  Widget build(BuildContext context) {
    // List of tasks
    final tasks = [
      {
        'name': 'Aisha Sharma',
        'deadline': '2024-07-15',
        'completed': 3,
        'total': 5,
        'color': Colors.green,
      },
      {
        'name': 'Divya Patel',
        'deadline': '2024-07-16',
        'completed': 5,
        'total': 5,
        'color': Colors.green,
      },
      {
        'name': 'Kavya Singh',
        'deadline': '2024-07-18',
        'completed': 1,
        'total': 5,
        'color': Colors.yellow,
      },
      {
        'name': 'Neha Gupta',
        'deadline': '2024-07-19',
        'completed': 2,
        'total': 5,
        'color': Colors.orange,
      },
      {
        'name': 'Pooja Yadav',
        'deadline': '2024-07-20',
        'completed': 4,
        'total': 5,
        'color': Colors.green,
      },
    ];

    // Filter only incomplete tasks
    List<Map<String, dynamic>> incompleteTasks = tasks
        .where((task) => (task['completed'] as int) < (task['total'] as int))
        .toList();

    // Filter tasks by search
    final filteredTasks = searchQuery.isEmpty
        ? incompleteTasks
        : incompleteTasks
              .where(
                (task) => (task['name'] as String).toLowerCase().contains(
                  searchQuery.toLowerCase(),
                ),
              )
              .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black, size: 28),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Expanded(
              child: Text(
                _getAppBarTitle(_selectedIndex),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.015 * 20,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.notifications, color: Colors.black, size: 28),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const NotificationsPage(),
                  ),
                );
              },
            ),
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert, color: Colors.black, size: 28),
              onSelected: (value) {
                if (value == 'logout') {
                  // Handle logout
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Logout'),
                        content: const Text('Are you sure you want to logout?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              // Navigate to login page or perform logout
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                '/',
                                (route) => false,
                              );
                            },
                            child: const Text('Logout'),
                          ),
                        ],
                      );
                    },
                  );
                } else if (value == 'help') {
                  // Handle help
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Help'),
                        content: const Text('For any assistance, please contact the support team at support@greencradle.com'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem<String>(
                  value: 'logout',
                  child: Row(
                    children: [
                      Icon(Icons.logout, color: Colors.black),
                      SizedBox(width: 8),
                      Text('Logout'),
                    ],
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'help',
                  child: Row(
                    children: [
                      Icon(Icons.help_outline, color: Colors.black),
                      SizedBox(width: 8),
                      Text('Help'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          // HOME TAB
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Section
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuC7lPAAW0mzRPank9Yboz55CjzUg_wOKwAsqSatBpTRq5b-EUX9QDIQL3PVMSzrrt0eiJ58e1gNY1WYRxbcI9jx8IvM-ESGoKA5qCq4pdG-WeuaO_Mcww_O3Ia8bkwWNLDHL2H1IR8oRrBti5PmZqE6tEOYVyi9eLwm_9yH1APhxSgXVUF61QmDVcia4H1HfM41NxGUxTxfLqJU16CHYBEYqX1ziaWyrMDfRfOZqh4ZcPYFHGJtHm-nWQ-KM1wSE0FIkjE4bCZIRL6h',
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              profileName,
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Raipur, Chhattisgarh',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'Mitanin Worker',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Upcoming Deadlines Section
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Upcoming Deadlines',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: 'Search mother name...',
                          hintStyle: GoogleFonts.poppins(color: Colors.black.withValues(alpha: 0.6)),
                          prefixIcon: Icon(Icons.search, color: Colors.black),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.black.withValues(alpha: 0.3)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.black.withValues(alpha: 0.3)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.black, width: 2),
                          ),
                          filled: true,
                          fillColor: Colors.black.withValues(alpha: 0.05),
                        ),
                        onChanged: (value) {
                          setState(() {
                            searchQuery = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                // Upcoming Deadlines List
                ...filteredTasks.map((task) => _buildTaskCard(
                  task['name'] as String,
                  task['deadline'] as String,
                  task['completed'] as int,
                  task['total'] as int,
                  task['color'] as Color,
                )),
                const SizedBox(height: 28),
                // New Mothers Section
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                  child: Text(
                    'New Mothers',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                ...mothersList.map((mother) => _buildMotherCard(mother)),
                const SizedBox(height: 20),
              ],
            ),
          ),
          // ASSIGNED MOTHERS TAB
          const AssignedMothersPage(),
          // PROFILE TAB
          ProfileScreen(
            name: profileName,
            onNameChanged: (newName) {
              setState(() {
                profileName = newName;
              });
            },
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Colors.black, width: 1.0),
          ),
        ),
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildBottomNavItem(
              icon: Icons.home_filled,
              label: 'Home',
              color: _selectedIndex == 0 ? Colors.black : Colors.black.withValues(alpha: 0.5),
              isActive: _selectedIndex == 0,
              onTap: () => setState(() => _selectedIndex = 0),
            ),
            _buildBottomNavItem(
              icon: Icons.groups,
              label: 'Assigned Mothers',
              color: _selectedIndex == 1 ? Colors.black : Colors.black.withValues(alpha: 0.5),
              isActive: _selectedIndex == 1,
              onTap: () => setState(() => _selectedIndex = 1),
            ),
            _buildBottomNavItem(
              icon: Icons.person,
              label: 'Profile',
              color: _selectedIndex == 2 ? Colors.black : Colors.black.withValues(alpha: 0.5),
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
        return 'Mitanin Dashboard';
      case 1:
        return 'Assigned Mothers';
      case 2:
        return 'Profile';
      default:
        return 'Mitanin Dashboard';
    }
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

  Widget _buildTaskCard(
    String name,
    String deadline,
    int completed,
    int total,
    Color color,
  ) {
    final double progress = (completed / total) * 100;
    final bool isCompleted = completed >= total;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: Colors.white,
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Icon(
                      Icons.pregnant_woman,
                      color: color,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Deadline: $deadline',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      isCompleted ? 'Completed' : 'Pending',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: color,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                'Sapling Photos: $completed/$total',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              LinearProgressIndicator(
                value: progress / 100,
                backgroundColor: Colors.black.withValues(alpha: 0.2),
                color: color,
                minHeight: 6,
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.photo_library, color: Colors.black),
                    label: const Text('View Photos', style: TextStyle(color: Colors.black)),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MotherVisitPage(motherName: name),
                        ),
                      );
                    },
                    icon: const Icon(Icons.visibility, color: Colors.white),
                    label: const Text('Visit', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMotherCard(Map<String, String> mother) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: Colors.white,
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(12),
                child: const Icon(
                  Icons.pregnant_woman,
                  color: Colors.black,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mother['name'] ?? '',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Village: ${mother['village']}',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: const StadiumBorder(),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Scaffold(
                        appBar: AppBar(
                          title: Text('Mother Details'),
                          backgroundColor: Colors.black,
                        ),
                        body: SingleChildScrollView(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name: ${mother['name']}',
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Husband/Father\'s Name: Rajesh Verma',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Phone Number: 9876543210',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Blood Group: B+',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Address: 123 Green Street, Raipur',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Delivery Date: 2025-07-10',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Delivery Address: City Hospital, Raipur',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'City: Raipur',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'District: Raipur',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Pincode: 492001',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Geolocation: 21.2514° N, 81.6296° E',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Pledge Plants: 5',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Pledge Photo:',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.grey[200],
                                  image: const DecorationImage(
                                    image: NetworkImage(
                                      'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=400&q=80',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 24,
                                      vertical: 12,
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      assignedMothers.add({
                                        'name': mother['name'] ?? '',
                                        'id': 'MTN00${assignedMothers.length + 1}',
                                        'photoStatus': 'Upload Pending',
                                        'photoStatusColor': '0xFFD32F2F',
                                        'photoStatusBg': '0xFFFEE2E2',
                                        'icon': 'error',
                                        'iconColor': '0xFFD32F2F',
                                        'phone': '9999999999',
                                        'address': 'Demo Address',
                                      });
                                      mothersList.removeWhere(
                                        (m) => m['name'] == mother['name'],
                                      );
                                      mothersAssigned = assignedMothers.length;
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  icon: const Icon(Icons.person_add, color: Colors.white),
                                  label: const Text(
                                    'Assign',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.person_add, color: Colors.white),
                label: const Text('Assign', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Notifications Page
class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  static const List<Map<String, String>> notifications = [
    {
      'title': 'New Mother Assigned',
      'body': 'You have been assigned to Sonal Verma.',
      'time': '2 min ago',
    },
    {
      'title': 'Photo Verified',
      'body': 'Sapling photo for Riya Kapoor has been verified.',
      'time': '10 min ago',
    },
    {
      'title': 'Upload Pending',
      'body': 'Please upload sapling photo for Meena Kumari.',
      'time': '1 hour ago',
    },
    {
      'title': 'Deadline Approaching',
      'body': 'Complete visit for Kavya Singh by 18 July.',
      'time': '3 hours ago',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black, size: 28),
              onPressed: () => Navigator.of(context).pop(),
            ),
            const Expanded(
              child: Text(
                'Notifications',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.015 * 20,
                ),
              ),
            ),
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert, color: Colors.black, size: 28),
              onSelected: (value) {
                if (value == 'logout') {
                  // Handle logout
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Logout'),
                        content: const Text('Are you sure you want to logout?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              // Navigate to login page or perform logout
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                '/',
                                (route) => false,
                              );
                            },
                            child: const Text('Logout'),
                          ),
                        ],
                      );
                    },
                  );
                } else if (value == 'help') {
                  // Handle help
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Help'),
                        content: const Text('For any assistance, please contact the support team at support@greencradle.com'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem<String>(
                  value: 'logout',
                  child: Row(
                    children: [
                      Icon(Icons.logout, color: Colors.black),
                      SizedBox(width: 8),
                      Text('Logout'),
                    ],
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'help',
                  child: Row(
                    children: [
                      Icon(Icons.help_outline, color: Colors.black),
                      SizedBox(width: 8),
                      Text('Help'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: notifications.length,
        separatorBuilder: (context, idx) => const SizedBox(height: 16),
        itemBuilder: (context, idx) {
          final notif = notifications[idx];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            color: Colors.white,
            elevation: 6,
            child: ListTile(
              leading: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(8),
                child: const Icon(Icons.notifications_active, color: Colors.black, size: 28),
              ),
              title: Text(
                notif['title']!,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                notif['body']!,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              trailing: Text(
                notif['time']!,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.black.withValues(alpha: 0.6),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}