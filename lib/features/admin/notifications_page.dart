import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    const Color backgroundColor = Color(0xFFF9FBF9);
    const Color darkTextColor = Color(0xFF121810);
    const Color primaryRedText = Color(0xFFCC0000);
    const Color notificationIconBgRed = Color(0xFFE05252);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: darkTextColor, size: 28),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            const Expanded(
              child: Text(
                'Notifications',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF121810),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.015 * 20,
                ),
              ),
            ),
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert, color: darkTextColor, size: 28),
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
                      Icon(Icons.logout, color: Color(0xFF121810)),
                      SizedBox(width: 8),
                      Text('Logout'),
                    ],
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'help',
                  child: Row(
                    children: [
                      Icon(Icons.help_outline, color: Color(0xFF121810)),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildNotificationItem(
              title: 'Anjali Patel: 1 sapling photo left to upload',
              subtitle: 'Week 1 upload pending',
              time: 'Week 1 (July 1-7)',
              darkTextColor: darkTextColor,
              primaryRedText: primaryRedText,
              notificationIconBgRed: notificationIconBgRed,
              icon: Icons.park_rounded,
              imageUrl: 'https://cdn.pixabay.com/photo/2015/03/04/22/35/avatar-659652_1280.png',
            ),
            _buildNotificationItem(
              title: 'Priya Sharma: 2 sapling photos left to upload',
              subtitle: 'Week 2 upload pending',
              time: 'Week 2 (July 8-14)',
              darkTextColor: darkTextColor,
              primaryRedText: primaryRedText,
              notificationIconBgRed: notificationIconBgRed,
              icon: Icons.park_rounded,
              imageUrl: 'https://cdn.pixabay.com/photo/2015/03/04/22/35/avatar-659652_1280.png',
            ),
            _buildNotificationItem(
              title: 'Meera Nair: 3 sapling photos left to upload',
              subtitle: 'Week 3 upload pending',
              time: 'Week 3 (July 15-21)',
              darkTextColor: darkTextColor,
              primaryRedText: primaryRedText,
              notificationIconBgRed: notificationIconBgRed,
              icon: Icons.park_rounded,
              imageUrl: 'https://cdn.pixabay.com/photo/2017/03/01/22/01/avatar-2109968_1280.png',
            ),
            _buildNotificationItem(
              title: 'Sunita Reddy: 2 sapling photos left to upload',
              subtitle: 'Week 4 upload pending',
              time: 'Week 4 (July 22-28)',
              darkTextColor: darkTextColor,
              primaryRedText: primaryRedText,
              notificationIconBgRed: notificationIconBgRed,
              icon: Icons.park_rounded,
              imageUrl: 'https://randomuser.me/api/portraits/women/65.jpg',
            ),
            _buildNotificationItem(
              title: 'Kavita Singh: 4 sapling photos left to upload',
              subtitle: 'Week 5 upload pending',
              time: 'Week 5 (July 29-Aug 4)',
              darkTextColor: darkTextColor,
              primaryRedText: primaryRedText,
              notificationIconBgRed: notificationIconBgRed,
              icon: Icons.park_rounded,
              imageUrl: 'https://cdn.pixabay.com/photo/2017/01/31/13/41/avatar-2024765_1280.png',
            ),
          ],
        ),
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
                  style: TextStyle(
                    color: darkTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
                ),
                Text(
                  subtitle,
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
} 