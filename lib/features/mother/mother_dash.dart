import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Notification Page for due saplings
class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> notifications = [
      {
        'title': 'Guava is Due Today',
        'body': 'Upload a photo for Guava. It is due today!'
      },
      {
        'title': 'Drumsticks Due in 1 day',
        'body': 'Drumsticks sapling needs a photo upload in 1 day.'
      },
      {
        'title': 'Amla Due in 3 days',
        'body': 'Don\'t forget to upload a photo for Amla.'
      },
      {
        'title': 'Papaya Due this week',
        'body': 'Papaya sapling is due for a photo upload this week.'
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.green, size: 28),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: Colors.green,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.015 * 20,
          ),
        ),
        centerTitle: true,
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
                  color: Colors.red.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(8),
                child: const Icon(Icons.notifications_active, color: Colors.red, size: 28),
              ),
              title: Text(
                notif['title']!,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.green,
                ),
              ),
              subtitle: Text(
                notif['body']!,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.green,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class MotherDashboard extends StatefulWidget {
  const MotherDashboard({super.key});

  @override
  State<MotherDashboard> createState() => _MotherDashboardState();
}

class _MotherDashboardState extends State<MotherDashboard> {
  int _selectedIndex = 0;
  String _sortBy = 'Due Date';
  List<Map<String, dynamic>> allSaplings = [
    {
      'name': 'Mango',
      'days': '15 days ago',
      'status': 'Safe',
      'progress': 75,
      'image': 'https://media.istockphoto.com/id/1019835828/photo/mango-and-leaf-isolated-white-background.jpg?s=612x612&w=0&k=20&c=_nmOBzO9mGEitT2rUvO1xAX9jwL5mHYI8AFRbYeyy-A=',
      'color': Colors.green
    },
    {
      'name': 'Guava',
      'days': '7 days ago',
      'status': 'Due Today',
      'progress': 30,
      'image': 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?auto=format&fit=crop&w=400&q=80',
      'color': Colors.red
    },
    {
      'name': 'Drumsticks',
      'days': '10 days ago',
      'status': 'Due in 1 day',
      'progress': 50,
      'image': 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=400&q=80',
      'color': Colors.red
    },
    {
      'name': 'Amla',
      'days': '12 days ago',
      'status': 'Due in 3 days',
      'progress': 20,
      'image': 'https://images.unsplash.com/photo-1465101046530-73398c7f28ca?auto=format&fit=crop&w=400&q=80',
      'color': Colors.red
    },
    {
      'name': 'Papaya',
      'days': '5 days ago',
      'status': 'Due this week',
      'progress': 10,
      'image': 'https://images.unsplash.com/photo-1506089676908-3592f7389d4d?auto=format&fit=crop&w=400&q=80',
      'color': Colors.red
    },
  ];

  List<Map<String, dynamic>> get dueSaplings => allSaplings.where((s) => s['status'] != 'Safe').toList();
  List<Map<String, dynamic>> get safeSaplings => allSaplings.where((s) => s['status'] == 'Safe').toList();

  void _sortSaplings(String? value) {
    if (value == null) return;
    setState(() {
      _sortBy = value;
      int compare(Map<String, dynamic> a, Map<String, dynamic> b) {
        if (value == 'Name') {
          return a['name'].toString().compareTo(b['name'].toString());
        } else if (value == 'Status') {
          return a['status'].toString().compareTo(b['status'].toString());
        } else {
          int getDays(String s) {
            final match = RegExp(r'(\d+)').firstMatch(s);
            return match != null ? int.parse(match.group(1)!) : 0;
          }
          return getDays(a['days'].toString()).compareTo(getDays(b['days'].toString()));
        }
      }
      allSaplings.sort(compare);
    });
  }

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
              icon: const Icon(Icons.arrow_back, color: Colors.green, size: 28),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Expanded(
              child: Text(
                _getAppBarTitle(_selectedIndex),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.015 * 20,
                ),
              ),
            ),
          IconButton(
              icon: const Icon(Icons.notifications, color: Colors.green, size: 28),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const NotificationPage()),
              );
            },
          ),
        ],
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          // HOME TAB (Mother Dashboard Overview)
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
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuDqKifDHhT7VaFSFrct2kzKj5LeGMWOjhEqpWxNiHB65S8W0dyCQLNpzsFjcww1dpVa4JRf7wuv_NIPPrEDUNiR-GQ03CyntcugadJBhT4VgdX3SvBxmIPXQlhyruz5c3Nuv_KwPS1J_RIS9Fu2w48y9BJ_qDgyJYLcLnGg52nBh2HYUY0QXzBBG6Sgtui0GARbLfOQcIPz7262H7W6vobiGW0-9c_lHTz2DcVDjurq9ti7TfuNOXe4B-b1KZhsmaNatdhGaAwg_-yp',
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                            Text(
                              'Priya Sharma',
                          style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                      const SizedBox(height: 4),
                            Text(
                              '123, Green Valley, Meadowlands',
                          style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '+91 98765 43210',
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
          // Due Saplings Section
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                  child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                      Text(
                        'Due Saplings',
                  style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
              DropdownButton<String>(
                value: _sortBy,
                items: const [
                  DropdownMenuItem(value: 'Due Date', child: Text('Due Date')),
                  DropdownMenuItem(value: 'Name', child: Text('Name')),
                  DropdownMenuItem(value: 'Status', child: Text('Status')),
                ],
                onChanged: _sortSaplings,
                underline: Container(),
                        dropdownColor: Colors.white,
                        style: const TextStyle(color: Colors.green),
                        icon: const Icon(Icons.arrow_drop_down, color: Colors.green),
              )
            ],
          ),
                ),
          ...dueSaplings.map((s) => SaplingCard(data: s)),
          const SizedBox(height: 28),
          // Your Saplings Section (Safe only)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                  child: Text(
                    'Your Saplings',
              style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
          ...safeSaplings.map((s) => SaplingCard(data: s)),
                const SizedBox(height: 20),
              ],
            ),
          ),
          // ASSISTANCE TAB
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
                    child: Text(
                      'Assistance',
                      style: const TextStyle(
                        color: Colors.green,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.015 * 22,
                      ),
                    ),
                  ),
                  // Assistance content from assistance.dart
                  ..._buildContactCards(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          // PROFILE TAB
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
                    child: Text(
                      'Profile',
                      style: const TextStyle(
                        color: Colors.green,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.015 * 22,
                      ),
                    ),
                  ),
                  // Profile content
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Center(
                          child: CircleAvatar(
                            radius: 54,
                            backgroundImage: NetworkImage(
                              'https://lh3.googleusercontent.com/aida-public/AB6AXuDqKifDHhT7VaFSFrct2kzKj5LeGMWOjhEqpWxNiHB65S8W0dyCQLNpzsFjcww1dpVa4JRf7wuv_NIPPrEDUNiR-GQ03CyntcugadJBhT4VgdX3SvBxmIPXQlhyruz5c3Nuv_KwPS1J_RIS9Fu2w48y9BJ_qDgyJYLcLnGg52nBh2HYUY0QXzBBG6Sgtui0GARbLfOQcIPz7262H7W6vobiGW0-9c_lHTz2DcVDjurq9ti7TfuNOXe4B-b1KZhsmaNatdhGaAwg_-yp',
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Priya Sharma',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '123, Green Valley, Meadowlands',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '+91 98765 43210',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        // Edit Profile Button
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: ElevatedButton.icon(
                            onPressed: () {
                              _showEditProfileDialog(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                            icon: const Icon(Icons.edit, size: 20),
                            label: const Text(
                              'Edit Profile',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Colors.green, width: 1.0),
          ),
        ),
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildBottomNavItem(
              icon: Icons.home_filled,
              label: 'Home',
              color: _selectedIndex == 0 ? Colors.green : Colors.green.withValues(alpha: 0.5),
              isActive: _selectedIndex == 0,
              onTap: () => setState(() => _selectedIndex = 0),
            ),
            _buildBottomNavItem(
              icon: Icons.help,
              label: 'Assistance',
              color: _selectedIndex == 1 ? Colors.green : Colors.green.withValues(alpha: 0.5),
              isActive: _selectedIndex == 1,
              onTap: () => setState(() => _selectedIndex = 1),
            ),
            _buildBottomNavItem(
              icon: Icons.person,
              label: 'Profile',
              color: _selectedIndex == 2 ? Colors.green : Colors.green.withValues(alpha: 0.5),
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
        return 'Mother Dashboard';
      case 1:
        return 'Assistance';
      case 2:
        return 'Profile';
      default:
        return 'Mother Dashboard';
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

  // Widget for Contact Cards in Assistance Tab
  List<Widget> _buildContactCards() {
    final contacts = [
      {
        'name': 'Ethan Harper',
        'designation': 'Field Supervisor',
        'address': '123 Maple Street, Anytown',
        'image':
            'https://lh3.googleusercontent.com/aida-public/AB6AXuAe9TRRmM0KMQjyHL7LPpt3b4Cny5llKC0iz2bJHmz3KrYpc-D61ap10HBIucQUVC3OaO1rNRPzs3zJAJ_vBquHDxQIlXOacI6CIxHYuK344YjtlRAsfxhJsc_CYsXvOkZYPY1MGh4fxWdPT66i0J6DSCxErFKSeDKfY9vgfSxEU8UDG-elT3oMqrJLGdZwaXmukjRt4lg7Do2JEaWUGn8KLltiH0Fg6t1GCnEhSpfMX0ncJVVYouftxw7tLSBCOMGDydEP70aq6CIU',
      },
      {
        'name': 'Olivia Bennett',
        'designation': 'Agronomist',
        'address': '456 Oak Avenue, Anytown',
        'image':
            'https://lh3.googleusercontent.com/aida-public/AB6AXuAQBA3k8x79ob8NdB-E1Q-n0ECBPG-xANK_4weVdVxMMdT5VL1FC9LuQ2r8hf9GNi1Hjoc1RS45W5YhT5FQbfd6qBADKN0JqzKymFef4tfNAVLcaCO9sIMtjPUMOBB4lw-przdKGxphKXhlmr4ZScow23xPd0I-WfEgbJrXGZjP4d7pNGGye1O7BBLyT1c-2c85Iwn48S6ncem86-9EtP__j8ReQBNynwJ8_S7dyzGM6-j5CoWhplCMn-0bhlOZsjzb4YMMzNdPWH9j',
      },
      {
        'name': 'Noah Carter',
        'designation': 'Irrigation Specialist',
        'address': '789 Pine Lane, Anytown',
        'image':
            'https://lh3.googleusercontent.com/aida-public/AB6AXuDFAzldnY25ljSQIe2naMcb54fEFTH5Dmp4-199INFkfOSOivP8wa1nCQnWzKUvpZ9qAeK15FIXaB8X2DyXKeHi4DoloJUWN6IV28ANufskcs23IgAhOEmC8LhgK5J0UyovQZ7wwZ1S_DxWIEIn5yhiCPsZLOeGlejMzUaGzjTZnG3y4PA0_iEPah2Jqz3D0WEwoEMGh4boY-ivJaKKDdAFt72NizzaWm5SJZBU7cpGuL23T4lY7taSYVjy0yNKZufdN92CsF5HC1Vl',
      },
      {
        'name': 'Ava Thompson',
        'designation': 'Soil Analyst',
        'address': '101 Elm Road, Anytown',
        'image':
            'https://lh3.googleusercontent.com/aida-public/AB6AXuAT-OqEFftGs-S-lClr9M7B7Cal1LFF8tpyjHwsfiqllobT4QPjCBfO9m2OW8ZPwGMqUkYMPUHUoFs8ssmvBcidICAU173E9jLYOfN1ohQGWvfOO36llYfqdiZTE460nIH0E-Oz8QocFxRq3YjXpcYVH_LPlWmCZlFPdCqVVrGhGNNn3p6h6gLgwYMG3odAYhLdL6Qcv-K9A2qZ5A3Put7Wal6a74h0CoIWxaHglDv4FHW2eBUwBrDcY_qtmW9hUn7Y2GihjHHnfVMY',
      },
    ];

    return contacts.map((contact) {
      return Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                ClipOval(
                  child: Image.network(
                    contact['image']!,
                    width: 56,
                    height: 56,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contact['name']!,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        contact['designation'] ?? '',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        contact['address']!,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Contact Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Colors.green),
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Message Now',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 0, color: Colors.transparent),
        ],
      );
    }).toList();
  }

  // Method to show edit profile dialog
  void _showEditProfileDialog(BuildContext context) {
    final TextEditingController nameController = TextEditingController(text: 'Priya Sharma');
    final TextEditingController addressController = TextEditingController(text: '123, Green Valley, Meadowlands');
    final TextEditingController phoneController = TextEditingController(text: '+91 98765 43210');

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Row(
            children: [
              const Icon(Icons.edit, color: Colors.green, size: 24),
              const SizedBox(width: 8),
              Text(
                'Edit Profile',
                style: GoogleFonts.poppins(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    labelStyle: const TextStyle(color: Colors.green),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.green, width: 2),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: addressController,
                  decoration: InputDecoration(
                    labelText: 'Address',
                    labelStyle: const TextStyle(color: Colors.green),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.green, width: 2),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    labelStyle: const TextStyle(color: Colors.green),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.green, width: 2),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.green),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Here you would typically save the changes
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Profile updated successfully!'),
                    backgroundColor: Colors.green,
                  ),
                );
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}

class SaplingCard extends StatelessWidget {
  final Map data;
  const SaplingCard({required this.data, super.key});

  String _getWeekText(String daysAgo) {
    final match = RegExp(r'(\d+)').firstMatch(daysAgo);
    if (match != null) {
      int days = int.parse(match.group(1)!);
      int week = (days / 7).ceil();
      return 'Planted: Week $week';
    }
    return 'Planted: Week 1';
  }

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(data['image'],
                        width: 64, height: 64, fit: BoxFit.cover),
                  ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text(
                          data['name'],
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          _getWeekText(data['days']),
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                      color: data['color'].withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      data['status'],
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: data['color'],
                      ),
                    ),
                )
              ],
            ),
            const SizedBox(height: 12),
            LinearProgressIndicator(
              value: data['progress'] / 100,
                backgroundColor: Colors.green.withValues(alpha: 0.2),
              color: data['color'],
              minHeight: 6,
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {},
                    icon: const Icon(Icons.photo_library, color: Colors.green),
                    label: const Text('View Photos', style: TextStyle(color: Colors.green)),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: data['color'],
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () {},
                    icon: const Icon(Icons.upload, color: Colors.white),
                    label: const Text('Upload', style: TextStyle(color: Colors.white)),
                ),
              ],
            )
          ],
          ),
        ),
      ),
    );
  }
}