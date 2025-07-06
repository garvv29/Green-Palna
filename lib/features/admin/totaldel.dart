import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// SVG paths for icons (same as provided in the previous turn)
const String _arrowLeftSvg = '''
  <svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" fill="currentColor" viewBox="0 0 256 256">
    <path d="M224,128a8,8,0,0,1-8,8H59.31l58.35,58.34a8,8,0,0,1-11.32,11.32l-72-72a8,8,0,0,1,0-11.32l72-72a8,8,0,0,1,11.32,11.32L59.31,120H216A8,8,0,0,1,224,128Z"></path>
  </svg>
''';

const String _caretLeftSvg = '''
  <svg xmlns="http://www.w3.org/2000/svg" width="18px" height="18px" fill="currentColor" viewBox="0 0 256 256">
    <path d="M165.66,202.34a8,8,0,0,1-11.32,11.32l-80-80a8,8,0,0,1,0-11.32l80-80a8,8,0,0,1,11.32,11.32L91.31,128Z"></path>
  </svg>
''';

const String _caretRightSvg = '''
  <svg xmlns="http://www.w3.org/2000/svg" width="18px" height="18px" fill="currentColor" viewBox="0 0 256 256">
    <path d="M181.66,133.66l-80,80a8,8,0,0,1-11.32-11.32L164.69,128,90.34,53.66a8,8,0,0,1,11.32-11.32l80,80A8,8,0,0,1,181.66,133.66Z"></path>
  </svg>
''';

const String _babySvg = '''
  <svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" fill="currentColor" viewBox="0 0 256 256">
    <path d="M92,140a12,12,0,1,1,12-12A12,12,0,0,1,92,140Zm72-24a12,12,0,1,0,12,12A12,12,0,0,0,164,116Zm-12.27,45.23a45,45,0,0,1-47.46,0,8,8,0,0,0-8.54,13.54,61,61,0,0,0,64.54,0,8,8,0,0,0-8.54-13.54ZM232,128A104,104,0,1,1,128,24,104.11,104.11,0,0,1,232,128Zm-16,0a88.11,88.11,0,0,0-84.09-87.91C120.32,56.38,120,71.88,120,72a8,8,0,0,0,16,0,8,8,0,0,1,16,0,24,24,0,0,1-48,0c0-.73.13-14.3,8.46-30.63A88,88,0,1,0,216,128Z"></path>
  </svg>
''';

class TotalDeliveriesPage extends StatefulWidget {
  const TotalDeliveriesPage({super.key}); // <-- Make sure this is const

  @override
  State<TotalDeliveriesPage> createState() => _TotalDeliveriesPageState();
}

class _TotalDeliveriesPageState extends State<TotalDeliveriesPage> {
  // Dummy data for baby details with random July dates
  final List<Map<String, String>> _birthDetails = [
    {
      'babyGender': 'Boy',
      'bloodGroup': 'A+',
      'motherName': 'Anjali Sharma',
      'healthWorker': 'Priya Sharma',
      'hospitalName': 'City Hospital',
      'date': '2025-07-03',
    },
    {
      'babyGender': 'Girl',
      'bloodGroup': 'B-',
      'motherName': 'Kavita Patel',
      'healthWorker': 'Suresh Kumar',
      'hospitalName': 'Central Clinic',
      'date': '2025-07-07',
    },
    {
      'babyGender': 'Boy',
      'bloodGroup': 'O-',
      'motherName': 'Sunita Verma',
      'healthWorker': 'Priya Sharma',
      'hospitalName': 'Greenwood Hospital',
      'date': '2025-07-12',
    },
    {
      'babyGender': 'Girl',
      'bloodGroup': 'AB+',
      'motherName': 'Rekha Singh',
      'healthWorker': 'Suresh Kumar',
      'hospitalName': 'City Hospital',
      'date': '2025-07-15',
    },
    {
      'babyGender': 'Boy',
      'bloodGroup': 'A-',
      'motherName': 'Meera Gupta',
      'healthWorker': 'Priya Sharma',
      'hospitalName': 'Central Clinic',
      'date': '2025-07-18',
    },
    {
      'babyGender': 'Girl',
      'bloodGroup': 'B+',
      'motherName': 'Pooja Reddy',
      'healthWorker': 'Suresh Kumar',
      'hospitalName': 'Greenwood Hospital',
      'date': '2025-07-21',
    },
    {
      'babyGender': 'Boy',
      'bloodGroup': 'O+',
      'motherName': 'Neha Kapoor',
      'healthWorker': 'Priya Sharma',
      'hospitalName': 'City Hospital',
      'date': '2025-07-23',
    },
    {
      'babyGender': 'Girl',
      'bloodGroup': 'AB-',
      'motherName': 'Divya Malhotra',
      'healthWorker': 'Suresh Kumar',
      'hospitalName': 'Central Clinic',
      'date': '2025-07-25',
    },
    {
      'babyGender': 'Boy',
      'bloodGroup': 'A+',
      'motherName': 'Ritu Choudhary',
      'healthWorker': 'Priya Sharma',
      'hospitalName': 'City Hospital',
      'date': '2025-07-27',
    },
    {
      'babyGender': 'Girl',
      'bloodGroup': 'B-',
      'motherName': 'Swati Joshi',
      'healthWorker': 'Suresh Kumar',
      'hospitalName': 'Central Clinic',
      'date': '2025-07-29',
    },
  ];

  DateTime _selectedMonth = DateTime.now(); // Initialize with current month
  DateTime? _selectedStartDate;
  DateTime? _selectedEndDate;

  @override
  void initState() {
    super.initState();
    // Set default selected dates for July 5th to 30th
    _selectedMonth = DateTime(2025, 7);
    _selectedStartDate = DateTime(2025, 7, 5);
    _selectedEndDate = DateTime(2025, 7, 30);
  }

  // Helper function to create SVG icon widgets from path strings
  Widget _buildSvgIcon(String path, {double? width, double? height}) {
    return SvgPicture.string(
      path,
      width: width,
      height: height,
      color: const Color(0xFF0E1A13), // Corresponds to text-[#0e1a13] fill
    );
  }

  // Function to get the first day of the month (e.g., if Oct 1st is Wednesday, returns 3 for col-start-4)
  int _getWeekdayOffset(DateTime date) {
    // DateTime.weekday returns 1 for Monday, 7 for Sunday.
    // We want 0 for Sunday, 1 for Monday, etc. for grid positioning.
    return date.weekday % 7;
  }

  // Function to generate days for the calendar grid
  List<Widget> _buildCalendarDays(BuildContext context) {
    final List<Widget> days = [];
    final firstDayOfMonth = DateTime(_selectedMonth.year, _selectedMonth.month, 1);
    final daysInMonth = DateTime(_selectedMonth.year, _selectedMonth.month + 1, 0).day;
    final weekdayOffset = _getWeekdayOffset(firstDayOfMonth); // 0 for Sun, 1 for Mon, ..., 6 for Sat

    // Add empty Sizedbox widgets for the leading blank days
    for (int i = 0; i < weekdayOffset; i++) {
      days.add(const SizedBox.shrink());
    }

    // Add day buttons
    for (int day = 1; day <= daysInMonth; day++) {
      final currentDate = DateTime(_selectedMonth.year, _selectedMonth.month, day);
      final bool isSelectedStart = currentDate.isAtSameMomentAs(_selectedStartDate ?? DateTime(0));
      final bool isSelectedEnd = currentDate.isAtSameMomentAs(_selectedEndDate ?? DateTime(0));
      final bool isInRange = (_selectedStartDate != null && _selectedEndDate != null) &&
          currentDate.isAfter(_selectedStartDate!) &&
          currentDate.isBefore(_selectedEndDate!);

      Color buttonBgColor = Colors.transparent;
      BorderRadius? borderRadius;
      Color dayTextColor = const Color(0xFF0E1A13);

      if (isSelectedStart) {
        buttonBgColor = const Color(0xFFE8F2EC);
        borderRadius = const BorderRadius.horizontal(left: Radius.circular(9999));
        dayTextColor = Colors.white; // Text color for selected day
      } else if (isSelectedEnd) {
        buttonBgColor = const Color(0xFFE8F2EC);
        borderRadius = const BorderRadius.horizontal(right: Radius.circular(9999));
        dayTextColor = Colors.white; // Text color for selected day
      } else if (isInRange) {
        buttonBgColor = const Color(0xFFE8F2EC);
      }

      days.add(
        Container(
          height: 48,
          width: double.infinity,
          decoration: BoxDecoration(
            color: buttonBgColor,
            borderRadius: borderRadius,
          ),
          child: TextButton(
            onPressed: () {
              // Handle date selection logic here
              setState(() {
                if (_selectedStartDate == null || _selectedEndDate != null) {
                  // Start a new selection
                  _selectedStartDate = currentDate;
                  _selectedEndDate = null;
                } else if (currentDate.isBefore(_selectedStartDate!)) {
                  // Select an earlier date as start
                  _selectedEndDate = _selectedStartDate;
                  _selectedStartDate = currentDate;
                } else {
                  // Select end date
                  _selectedEndDate = currentDate;
                }
              });
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9999)),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (isSelectedStart || isSelectedEnd) ? const Color(0xFF39E079) : Colors.transparent,
              ),
              alignment: Alignment.center,
              child: Text(
                '$day',
                style: TextStyle(
                  color: (isSelectedStart || isSelectedEnd) ? Colors.white : dayTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  height: 1.25,
                ),
              ),
            ),
          ),
        ),
      );
    }
    return days;
  }

  @override
  Widget build(BuildContext context) {
    // Filter birth details based on selected date range
    List<Map<String, String>> filteredBirthDetails = _birthDetails.where((detail) {
      final date = DateTime.parse(detail['date']!);
      if (_selectedStartDate != null && _selectedEndDate != null) {
        return !date.isBefore(_selectedStartDate!) && !date.isAfter(_selectedEndDate!);
      } else if (_selectedStartDate != null) {
        return date.isAtSameMomentAs(_selectedStartDate!);
      }
      return true;
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF8FBFA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Top Header
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context); // Go back
                      },
                      child: SizedBox(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: _buildSvgIcon(_arrowLeftSvg),
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        'Total Deliveries',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF0E1A13),
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          height: 1.25,
                          letterSpacing: -0.015 * 18,
                        ),
                      ),
                    ),
                    const SizedBox(width: 48), // Spacer for alignment with back button
                  ],
                ),
              ),

              // Filter by Date Header
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Filter by Date',
                    style: TextStyle(
                      color: Color(0xFF0E1A13),
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      height: 1.25,
                      letterSpacing: -0.015 * 18,
                    ),
                  ),
                ),
              ),

              // Date Picker Section (Shrunk calendar)
              Padding(
                padding: const EdgeInsets.all(16),
                child: Wrap(
                  spacing: 24,
                  runSpacing: 24,
                  alignment: WrapAlignment.center,
                  children: [
                    Container(
                      constraints: const BoxConstraints(minWidth: 220, maxWidth: 260), // Shrunk width
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _selectedMonth = DateTime(_selectedMonth.year, _selectedMonth.month - 1);
                                    });
                                  },
                                  icon: SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: Center(
                                      child: _buildSvgIcon(_caretLeftSvg, width: 18, height: 18),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    // Format month and year
                                    '${_selectedMonth.monthName} ${_selectedMonth.year}',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Color(0xFF0E1A13),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                      height: 1.25,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _selectedMonth = DateTime(_selectedMonth.year, _selectedMonth.month + 1);
                                    });
                                  },
                                  icon: SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: Center(
                                      child: _buildSvgIcon(_caretRightSvg, width: 18, height: 18),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Weekday headers
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 7,
                              childAspectRatio: 1.0,
                              mainAxisSpacing: 0,
                              crossAxisSpacing: 0,
                            ),
                            itemCount: 7,
                            itemBuilder: (context, index) {
                              final weekdays = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
                              return SizedBox(
                                height: 32, // Shrunk height
                                width: double.infinity,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 2),
                                    child: Text(
                                      weekdays[index],
                                      style: const TextStyle(
                                        color: Color(0xFF0E1A13),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w800,
                                        height: 1.25,
                                        letterSpacing: 0.015 * 13,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          // Days of the month
                          GridView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 7,
                              childAspectRatio: 1.0,
                              mainAxisSpacing: 0,
                              crossAxisSpacing: 0,
                            ),
                            children: _buildCalendarDays(context),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Birth Details Header
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Birth Details',
                    style: TextStyle(
                      color: Color(0xFF0E1A13),
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      height: 1.25,
                      letterSpacing: -0.015 * 18,
                    ),
                  ),
                ),
              ),

              // Birth Details List (filtered)
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: filteredBirthDetails.length,
                itemBuilder: (context, index) {
                  final detail = filteredBirthDetails[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Container(
                      constraints: const BoxConstraints(minHeight: 72),
                      color: const Color(0xFFF8FBFA),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: const Color(0xFFE8F2EC),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: _buildSvgIcon(_babySvg),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Baby: ${detail['babyGender']}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Color(0xFF0E1A13),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    height: 1.25,
                                  ),
                                ),
                                Text(
                                  'Mother: ${detail['motherName']}',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Color(0xFF51946B),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    height: 1.25,
                                  ),
                                ),
                                Text(
                                  'Hospital: ${detail['hospitalName']} | Date: ${detail['date']}',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Color(0xFF51946B),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    height: 1.25,
                                  ),
                                ),
                                Text(
                                  'Health Worker: ${detail['healthWorker']}',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Color(0xFF51946B),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    height: 1.25,
                                  ),
                                ),
                                Text(
                                  'Blood Group: ${detail['bloodGroup']}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Color(0xFF51946B),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    height: 1.25,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              // Bottom spacing
              Container(
                height: 20,
                color: const Color(0xFFF8FBFA),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Extension to get month name for DateTime
extension DateTimeExtension on DateTime {
  String get monthName {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }
}