import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9fbf9),
      appBar: AppBar(
        backgroundColor: const Color(0xfff9fbf9),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xff121811)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        automaticallyImplyLeading: false,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Color(0xff121811),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Color(0xff121811)),
            onPressed: () {
              // Edit action
            },
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Color(0xff121811)),
            onSelected: (value) {
              if (value == 'help') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Help'),
                    content: const Text('For assistance, contact support@greendemo.com'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              } else if (value == 'signout') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Sign Out'),
                    content: const Text('Are you sure you want to sign out?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                          // Add sign out logic here
                        },
                        child: const Text('Sign Out'),
                      ),
                    ],
                  ),
                );
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'help',
                child: Text('Help'),
              ),
              const PopupMenuItem(
                value: 'signout',
                child: Text('Sign Out'),
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          const SizedBox(height: 24),
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
              color: const Color(0xff121811),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            '123, Green Valley, Meadowlands',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: const Color(0xff64875e),
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            '+91 98765 43210',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: const Color(0xff64875e),
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
