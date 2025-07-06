import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AssignedMothersPage extends StatefulWidget {
  const AssignedMothersPage({super.key});

  @override
  State<AssignedMothersPage> createState() => _AssignedMothersPageState();
}

class _AssignedMothersPageState extends State<AssignedMothersPage> {
  int? hoveredIndex;

  @override
  Widget build(BuildContext context) {
    final mothers = [
      {
        'name': 'Ananya Verma',
        'id': 'MTN001',
        'photoStatus': 'Uploaded & Verified',
        'photoStatusColor': const Color(0xFF22C55E),
        'photoStatusBg': Color(0xFFD1FAE5),
        'icon': Icons.check_circle,
        'iconColor': const Color(0xFF22C55E),
        'phone': '9876543210',
        'address': '123 Green Street, Raipur',
      },
      {
        'name': 'Riya Kapoor',
        'id': 'MTN002',
        'photoStatus': 'Upload Pending',
        'photoStatusColor': const Color(0xFFD32F2F),
        'photoStatusBg': const Color(0xFFFEE2E2),
        'icon': Icons.error,
        'iconColor': const Color(0xFFD32F2F),
        'phone': '9123456780',
        'address': '45 Blue Avenue, Bilaspur',
      },
      {
        'name': 'Saanvi Mishra',
        'id': 'MTN003',
        'photoStatus': 'Uploaded & Verified',
        'photoStatusColor': const Color(0xFF22C55E),
        'photoStatusBg': Color(0xFFD1FAE5),
        'icon': Icons.check_circle,
        'iconColor': const Color(0xFF22C55E),
        'phone': '9988776655',
        'address': '78 Lake Road, Durg',
      },
      {
        'name': 'Priya Singh',
        'id': 'MTN004',
        'photoStatus': 'Uploaded & Verified',
        'photoStatusColor': const Color(0xFF22C55E),
        'photoStatusBg': Color(0xFFD1FAE5),
        'icon': Icons.check_circle,
        'iconColor': const Color(0xFF22C55E),
        'phone': '9001122334',
        'address': '12 Hill View, Bhilai',
      },
      {
        'name': 'Meera Joshi',
        'id': 'MTN005',
        'photoStatus': 'Geotagging Incorrect',
        'photoStatusColor': const Color(0xFFD32F2F),
        'photoStatusBg': const Color(0xFFFEE2E2),
        'icon': Icons.error,
        'iconColor': const Color(0xFFD32F2F),
        'phone': '9011223344',
        'address': '56 River Lane, Korba',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
                child: Text(
                  'Assigned Mothers',
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    letterSpacing: -0.015 * 22,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Mothers List
              ...List.generate(mothers.length, (index) {
                final mother = mothers[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    color: Colors.white,
                    elevation: 4,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                MotherPhotoProgressPage(mother: mother),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(16),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.07),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: const EdgeInsets.all(12),
                                  child: Icon(
                                    Icons.pregnant_woman,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        (mother['name'] as String?) ?? '',
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        'ID: ${mother['id']}',
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: (mother['photoStatusBg'] as Color)
                                        .withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    (mother['photoStatus'] as String?) ?? '',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color:
                                          ((mother['photoStatus'] as String?) ??
                                                      '')
                                                  .toLowerCase() ==
                                              'uploaded & verified'
                                          ? mother['photoStatusColor'] as Color
                                          : Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Icon(
                                  Icons.phone,
                                  size: 16,
                                  color: Colors.black,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    (mother['phone'] as String?) ?? '',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 16,
                                  color: Colors.black,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    (mother['address'] as String?) ?? '',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.photo_library,
                                    color: Colors.black,
                                  ),
                                  label: Text(
                                    'View Photos',
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    shape: const StadiumBorder(),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            MotherPhotoProgressPage(
                                              mother: mother,
                                            ),
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.visibility,
                                    color: Colors.white,
                                  ),
                                  label: Text(
                                    'View Details',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class MotherPhotoProgressPage extends StatelessWidget {
  final Map<String, dynamic> mother;

  const MotherPhotoProgressPage({super.key, required this.mother});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.green, size: 28),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          '${mother['name']} - Progress',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.015 * 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Mother Info Card
              Card(
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
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.green.withValues(
                              alpha: 0.1,
                            ),
                            child: Icon(
                              Icons.pregnant_woman,
                              color: Colors.green,
                              size: 30,
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
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'ID: ${mother['id']}',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      _buildInfoRow(
                        Icons.phone,
                        'Phone',
                        mother['phone'] ?? '',
                      ),
                      const SizedBox(height: 8),
                      _buildInfoRow(
                        Icons.location_on,
                        'Address',
                        mother['address'] ?? '',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Photo Status Section
              Text(
                'Photo Status',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),
              Card(
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
                          color: (mother['photoStatusBg'] as Color).withValues(
                            alpha: 0.1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Icon(
                          mother['icon'] as IconData,
                          color: mother['iconColor'] as Color,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Planting Photo',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              mother['photoStatus']?.toString() ?? '',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color:
                                    ((mother['photoStatus']
                                                ?.toString()
                                                .toLowerCase() ??
                                            '') ==
                                        'upload pending')
                                    ? mother['photoStatusColor'] as Color
                                    : ((mother['photoStatus']
                                                  ?.toString()
                                                  .toLowerCase() ??
                                              '') ==
                                          'uploaded & verified')
                                    ? mother['photoStatusColor'] as Color
                                    : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.withValues(alpha: 0.1),
                        foregroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.photo_library),
                      label: Text(
                        'View Photos',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.edit),
                      label: Text(
                        'Update Status',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.black),
        const SizedBox(width: 8),
        Text(
          '$label: ',
          style: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
        ),
        Expanded(
          child: Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
