import 'package:flutter/material.dart';

// Dummy data structure for a mother's sapling monitoring progress
class MotherSaplingProgress {
  final String name;
  final int uploadedImages;
  final int totalSaplings;
  final String dueDate; // e.g., "Due in 3 days", "Due tomorrow", "Overdue"

  MotherSaplingProgress({
    required this.name,
    required this.uploadedImages,
    required this.totalSaplings,
    required this.dueDate,
  });

  double get progressPercentage => uploadedImages / totalSaplings;
}


class LocalWorkerDashboardPage extends StatelessWidget {
  const LocalWorkerDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Define colors from HTML for consistency
    const Color backgroundColor = Color(0xFFF9FBF9);
    const Color darkTextColor = Color(0xFF111A0F);
    const Color lightGreenBgColor = Color(0xFFEBF2E9);
    const Color secondaryTextColor = Color(0xFF629155);
    const Color progressBarBgColor = Color(0xFFD6E5D2);
    const Color primaryGreen = Color(0xFF50D22C); // Your specified green

    // --- Dummy Data for demonstration ---
    final List<MotherSaplingProgress> saplingDeadlines = [
      MotherSaplingProgress(
        name: 'Priya Sharma',
        uploadedImages: 3,
        totalSaplings: 5,
        dueDate: 'Due in 3 days',
      ),
      MotherSaplingProgress(
        name: 'Anjali Patel',
        uploadedImages: 5,
        totalSaplings: 5,
        dueDate: 'Completed',
      ),
      MotherSaplingProgress(
        name: 'Meera Nair',
        uploadedImages: 1,
        totalSaplings: 5,
        dueDate: 'Due tomorrow',
      ),
      MotherSaplingProgress(
        name: 'Sunita Reddy',
        uploadedImages: 2,
        totalSaplings: 5,
        dueDate: 'Overdue by 1 day',
      ),
    ];
    // --- End Dummy Data ---

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false, // We'll add our own back button
        title: Row(
          children: [
            // Back Button
            IconButton(
              icon: Icon(Icons.arrow_back, color: darkTextColor, size: 28),
              onPressed: () => Navigator.of(context).pop(),
            ),
            Expanded(
              child: Text(
                'Green Cradle Initiative',
                textAlign: TextAlign.center, // text-center
                style: TextStyle(
                  color: darkTextColor, // text-[#111a0f]
                  fontSize: 20, // text-lg, adjusted for AppBar consistency
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.015 * 20,
                ),
              ),
            ),
            const SizedBox(width: 48), // To balance the back button on the left
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Upcoming Deadlines Section Title
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 12), // px-4 pb-3 pt-5
              child: Text(
                'Upcoming Deadlines',
                style: TextStyle(
                  color: darkTextColor, // text-[#111a0f]
                  fontSize: 22, // text-[22px]
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.015 * 22,
                ),
              ),
            ),
            // Dynamically build Upcoming Deadlines items for each mother
            ...saplingDeadlines.map((progressItem) {
              return _buildUpcomingDeadlineItem(
                icon: Icons.park, // Tree icon (representing Saplings)
                iconBgColor: lightGreenBgColor, // bg-[#ebf2e9]
                title: '${progressItem.name}\'s Sapling Monitoring', // Specific to the mother
                uploadedInfo: 'Uploaded ${progressItem.uploadedImages}/${progressItem.totalSaplings}',
                dueDateInfo: progressItem.dueDate,
                progress: progressItem.progressPercentage,
                darkTextColor: darkTextColor,
                secondaryTextColor: secondaryTextColor,
                progressBarBgColor: progressBarBgColor,
                progressBarFillColor: primaryGreen,
              );
            }).toList(),

            const SizedBox(height: 16), // Spacing between sections

            // New Mothers Section Title
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 12), // px-4 pb-3 pt-5
              child: Text(
                'New Mothers',
                style: TextStyle(
                  color: darkTextColor, // text-[#111a0f]
                  fontSize: 22, // text-[22px]
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.015 * 22,
                ),
              ),
            ),
            _buildNewMotherListItem(
              imageUrl: 'https://cdn.pixabay.com/photo/2015/03/04/22/35/avatar-659652_1280.png',
              name: 'Priya Sharma',
              address: 'Address: 12 Lotus Colony',
              darkTextColor: darkTextColor,
              secondaryTextColor: secondaryTextColor,
            ),
            _buildNewMotherListItem(
              imageUrl: 'https://cdn.pixabay.com/photo/2017/03/01/22/01/avatar-2109968_1280.png',
              name: 'Anjali Patel',
              address: 'Address: 45 MG Road',
              darkTextColor: darkTextColor,
              secondaryTextColor: secondaryTextColor,
            ),
            _buildNewMotherListItem(
              imageUrl: 'https://cdn.pixabay.com/photo/2017/01/31/13/41/avatar-2024765_1280.png',
              name: 'Meera Nair',
              address: 'Address: 78 Nehru Street',
              darkTextColor: darkTextColor,
              secondaryTextColor: secondaryTextColor,
            ),
            const SizedBox(height: 20), // h-5 bg-[#f9fbf9] spacer at bottom
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: backgroundColor, // bg-[#f9fbf9]
          border: Border(
            top: BorderSide(color: lightGreenBgColor, width: 1.0), // border-t border-[#ebf2e9]
          ),
        ),
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 12), // px-4 pb-3 pt-2
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildBottomNavItem(
              icon: Icons.home_filled, // House filled icon
              label: 'Home',
              color: darkTextColor, // text-[#111a0f]
              isActive: true, // Assuming Home is active by default
            ),
            _buildBottomNavItem(
              icon: Icons.people, // Users regular icon
              label: 'Mothers',
              color: secondaryTextColor, // text-[#629155]
              isActive: false,
            ),
            _buildBottomNavItem(
              icon: Icons.park_outlined, // Tree regular icon
              label: 'Saplings',
              color: secondaryTextColor, // text-[#629155]
              isActive: false,
            ),
            _buildBottomNavItem(
              icon: Icons.bar_chart_outlined, // PresentationChart regular icon
              label: 'Reports',
              color: secondaryTextColor, // text-[#629155]
              isActive: false,
            ),
          ],
        ),
      ),
    );
  }

  // Widget for Upcoming Deadlines item
  Widget _buildUpcomingDeadlineItem({
    required IconData icon,
    required Color iconBgColor,
    required String title,
    required String uploadedInfo,
    required String dueDateInfo,
    required double progress,
    required Color darkTextColor,
    required Color secondaryTextColor,
    required Color progressBarBgColor,
    required Color progressBarFillColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // px-4 py-3
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: darkTextColor,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          // Make the text column take up remaining space
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: darkTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  uploadedInfo,
                  style: TextStyle(
                    color: secondaryTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    height: 1.5,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  dueDateInfo,
                  style: TextStyle(
                    color: secondaryTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    height: 1.5,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 12), // Add spacing before progress bar
          // Progress bar column (fixed width)
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 88,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: progressBarBgColor,
                    valueColor: AlwaysStoppedAnimation<Color>(progressBarFillColor),
                    minHeight: 4,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${(progress * 100).round()}%',
                style: TextStyle(
                  color: darkTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Widget for New Mothers list item
  Widget _buildNewMotherListItem({
    required String imageUrl,
    required String name,
    required String address,
    required Color darkTextColor,
    required Color secondaryTextColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // px-4 py-2
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center, // items-center
        children: [
          Container(
            height: 56, // h-14
            width: 56, // w-fit, aspect-square
            decoration: BoxDecoration(
              shape: BoxShape.circle, // rounded-full
              image: DecorationImage(
                fit: BoxFit.cover, // bg-cover
                image: NetworkImage(imageUrl), // background-image: url(...)
              ),
            ),
          ),
          const SizedBox(width: 16), // gap-4
          Expanded( // flex-1
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center, // justify-center
              children: [
                Text(
                  name,
                  maxLines: 1, // line-clamp-1
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: darkTextColor, // text-[#111a0f]
                    fontSize: 16, // text-base
                    fontWeight: FontWeight.w500, // font-medium
                    height: 1.5, // leading-normal
                  ),
                ),
                Text(
                  address,
                  maxLines: 2, // line-clamp-2
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: secondaryTextColor, // text-[#629155]
                    fontSize: 14, // text-sm
                    fontWeight: FontWeight.normal, // font-normal
                    height: 1.5, // leading-normal
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
  }) {
    return Expanded( // flex-1
      child: InkWell( // Use InkWell for tap feedback
        onTap: () {
          // Handle navigation here
          debugPrint('Tapped $label');
          // In a real app, this would navigate to a different screen or update a state
        },
        customBorder: const StadiumBorder(), // rounded-full for the ripple effect
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0), // gap-1 and adjust padding
          child: Column(
            mainAxisSize: MainAxisSize.min, // shrink-0
            children: [
              Icon(
                icon,
                color: color,
                size: 28, // h-8, adjusted for icon size
              ),
              const SizedBox(height: 4), // gap-1
              Text(
                label,
                style: TextStyle(
                  color: color,
                  fontSize: 10, // text-xs, adjusted for better readability (originally 12 for text-xs)
                  fontWeight: FontWeight.w500, // font-medium
                  height: 1.5, // leading-normal
                  letterSpacing: 0.015 * 10, // tracking-[0.015em]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}