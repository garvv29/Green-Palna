import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlantDistributionPage extends StatefulWidget {
  const PlantDistributionPage({super.key});

  @override
  State<PlantDistributionPage> createState() => _PlantDistributionPageState();
}

class _PlantDistributionPageState extends State<PlantDistributionPage> {
  // Calendar state (copied and adapted from totaldel.dart)
  DateTime _selectedMonth = DateTime.now();
  DateTime? _selectedStartDate;
  DateTime? _selectedEndDate;

  // Dummy data for plant distributions
  final List<Map<String, dynamic>> _distributions = [
    {
      'doctor': 'Dr. Maya Sharma',
      'date': '2025-07-26',
      'mother': 'Priya Patel',
      'plants': {'Mango (Aam)': 1, 'Guava (Amrood)': 1, 'Indian Gooseberry (Amla)': 0, 'Papaya (Papita)': 1, 'Drumstick Tree (Moringa/Munga)': 0},
    },
    {
      'doctor': 'Dr. Anika Verma',
      'date': '2025-07-25',
      'mother': 'Neha Singh',
      'plants': {'Mango (Aam)': 1, 'Guava (Amrood)': 1, 'Indian Gooseberry (Amla)': 0, 'Papaya (Papita)': 1, 'Drumstick Tree (Moringa/Munga)': 0},
    },
    {
      'doctor': 'Dr. Kavya Iyer',
      'date': '2025-07-24',
      'mother': 'Divya Rao',
      'plants': {'Mango (Aam)': 1, 'Guava (Amrood)': 1, 'Indian Gooseberry (Amla)': 1, 'Papaya (Papita)': 0, 'Drumstick Tree (Moringa/Munga)': 1},
    },
    {
      'doctor': 'Dr. Ritu Sinha',
      'date': '2025-07-10',
      'mother': 'Meena Kumari',
      'plants': {'Mango (Aam)': 0, 'Guava (Amrood)': 1, 'Indian Gooseberry (Amla)': 1, 'Papaya (Papita)': 1, 'Drumstick Tree (Moringa/Munga)': 1},
    },
    {
      'doctor': 'Dr. Sneha Gupta',
      'date': '2025-07-15',
      'mother': 'Asha Yadav',
      'plants': {'Mango (Aam)': 1, 'Guava (Amrood)': 0, 'Indian Gooseberry (Amla)': 1, 'Papaya (Papita)': 0, 'Drumstick Tree (Moringa/Munga)': 1},
    },
    {
      'doctor': 'Dr. Pooja Jain',
      'date': '2025-07-19',
      'mother': 'Shalini Mishra',
      'plants': {'Mango (Aam)': 1, 'Guava (Amrood)': 1, 'Indian Gooseberry (Amla)': 0, 'Papaya (Papita)': 1, 'Drumstick Tree (Moringa/Munga)': 0},
    },
    {
      'doctor': 'Dr. Nisha Rao',
      'date': '2025-07-05',
      'mother': 'Kiran Sharma',
      'plants': {'Mango (Aam)': 0, 'Guava (Amrood)': 1, 'Indian Gooseberry (Amla)': 1, 'Papaya (Papita)': 1, 'Drumstick Tree (Moringa/Munga)': 1},
    },
    {
      'doctor': 'Dr. Vandana Joshi',
      'date': '2025-07-28',
      'mother': 'Seema Singh',
      'plants': {'Mango (Aam)': 1, 'Guava (Amrood)': 1, 'Indian Gooseberry (Amla)': 1, 'Papaya (Papita)': 0, 'Drumstick Tree (Moringa/Munga)': 0},
    },
    {
      'doctor': 'Dr. Shreya Mehta',
      'date': '2025-07-12',
      'mother': 'Radhika Pandey',
      'plants': {'Mango (Aam)': 1, 'Guava (Amrood)': 0, 'Indian Gooseberry (Amla)': 1, 'Papaya (Papita)': 1, 'Drumstick Tree (Moringa/Munga)': 1},
    },
    {
      'doctor': 'Dr. Anu Saxena',
      'date': '2025-07-22',
      'mother': 'Pallavi Deshmukh',
      'plants': {'Mango (Aam)': 0, 'Guava (Amrood)': 1, 'Indian Gooseberry (Amla)': 1, 'Papaya (Papita)': 1, 'Drumstick Tree (Moringa/Munga)': 0},
    },
    {
      'doctor': 'Dr. Sunita Reddy',
      'date': '2025-07-03',
      'mother': 'Kavita Singh',
      'plants': {'Mango (Aam)': 1, 'Guava (Amrood)': 1, 'Indian Gooseberry (Amla)': 1, 'Papaya (Papita)': 1, 'Drumstick Tree (Moringa/Munga)': 1},
    },
    {
      'doctor': 'Dr. Rekha Malhotra',
      'date': '2025-07-07',
      'mother': 'Swati Joshi',
      'plants': {'Mango (Aam)': 1, 'Guava (Amrood)': 0, 'Indian Gooseberry (Amla)': 0, 'Papaya (Papita)': 1, 'Drumstick Tree (Moringa/Munga)': 1},
    },
    {
      'doctor': 'Dr. Geeta Kapoor',
      'date': '2025-07-14',
      'mother': 'Anjali Verma',
      'plants': {'Mango (Aam)': 0, 'Guava (Amrood)': 1, 'Indian Gooseberry (Amla)': 1, 'Papaya (Papita)': 1, 'Drumstick Tree (Moringa/Munga)': 1},
    },
    {
      'doctor': 'Dr. Meera Choudhary',
      'date': '2025-07-18',
      'mother': 'Pooja Sharma',
      'plants': {'Mango (Aam)': 1, 'Guava (Amrood)': 1, 'Indian Gooseberry (Amla)': 1, 'Papaya (Papita)': 0, 'Drumstick Tree (Moringa/Munga)': 1},
    },
    {
      'doctor': 'Dr. Smita Patel',
      'date': '2025-07-21',
      'mother': 'Ritu Gupta',
      'plants': {'Mango (Aam)': 1, 'Guava (Amrood)': 1, 'Indian Gooseberry (Amla)': 0, 'Papaya (Papita)': 1, 'Drumstick Tree (Moringa/Munga)': 1},
    },
    {
      'doctor': 'Dr. Neha Kumar',
      'date': '2025-07-27',
      'mother': 'Divya Singh',
      'plants': {'Mango (Aam)': 1, 'Guava (Amrood)': 1, 'Indian Gooseberry (Amla)': 1, 'Papaya (Papita)': 1, 'Drumstick Tree (Moringa/Munga)': 0},
    },
    {
      'doctor': 'Dr. Priya Yadav',
      'date': '2025-07-30',
      'mother': 'Kiran Patel',
      'plants': {'Mango (Aam)': 0, 'Guava (Amrood)': 1, 'Indian Gooseberry (Amla)': 1, 'Papaya (Papita)': 1, 'Drumstick Tree (Moringa/Munga)': 0},
    },
  ];

  @override
  void initState() {
    super.initState();
    _selectedMonth = DateTime(2025, 7);
    _selectedStartDate = DateTime(2025, 7, 3);
    _selectedEndDate = DateTime(2025, 7, 30);
  }

  // SVGs for calendar navigation
  static const String _caretLeftSvg = '''
    <svg xmlns="http://www.w3.org/2000/svg" width="18px" height="18px" fill="currentColor" viewBox="0 0 256 256">
      <path d="M165.66,202.34a8,8,0,0,1-11.32,11.32l-80-80a8,8,0,0,1,0-11.32l80-80a8,8,0,0,1,11.32,11.32L91.31,128Z"></path>
    </svg>
  ''';
  static const String _caretRightSvg = '''
    <svg xmlns="http://www.w3.org/2000/svg" width="18px" height="18px" fill="currentColor" viewBox="0 0 256 256">
      <path d="M181.66,133.66l-80,80a8,8,0,0,1-11.32-11.32L164.69,128,90.34,53.66a8,8,0,0,1,11.32-11.32l80,80A8,8,0,0,1,181.66,133.66Z"></path>
    </svg>
  ''';

  Widget _buildSvgIcon(String path, {double? width, double? height}) {
    return SvgPicture.string(
      path,
      width: width,
      height: height,
      color: const Color(0xFF0E1A13),
    );
  }

  int _getWeekdayOffset(DateTime date) {
    return date.weekday % 7;
  }

  List<Widget> _buildCalendarDays(BuildContext context) {
    final List<Widget> days = [];
    final firstDayOfMonth = DateTime(_selectedMonth.year, _selectedMonth.month, 1);
    final daysInMonth = DateTime(_selectedMonth.year, _selectedMonth.month + 1, 0).day;
    final weekdayOffset = _getWeekdayOffset(firstDayOfMonth);

    for (int i = 0; i < weekdayOffset; i++) {
      days.add(const SizedBox.shrink());
    }

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
        dayTextColor = Colors.white;
      } else if (isSelectedEnd) {
        buttonBgColor = const Color(0xFFE8F2EC);
        borderRadius = const BorderRadius.horizontal(right: Radius.circular(9999));
        dayTextColor = Colors.white;
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
              setState(() {
                if (_selectedStartDate == null || _selectedEndDate != null) {
                  _selectedStartDate = currentDate;
                  _selectedEndDate = null;
                } else if (currentDate.isBefore(_selectedStartDate!)) {
                  _selectedEndDate = _selectedStartDate;
                  _selectedStartDate = currentDate;
                } else {
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

  Widget buildPlantRow(String plantName, int count) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 56,
      color: const Color(0xFFF8FCF9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              plantName,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF0E1B12),
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            '$count',
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF0E1B12),
            ),
          )
        ],
      ),
    );
  }

  Widget buildDistributionCard(String doctor, String date, String mother, Map<String, int> plants) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Text(
            date,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0E1B12),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          color: const Color(0xFFF8FCF9),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(doctor, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF0E1B12))),
                  Text('Distribution Date: $date', style: const TextStyle(fontSize: 14, color: Color(0xFF4E9767))),
                  Text('Mother: $mother', style: const TextStyle(fontSize: 14, color: Color(0xFF4E9767))),
            ],
          ),
        ),
        ...plants.entries.map((entry) => buildPlantRow(entry.key, entry.value)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // Filter distributions based on selected date range
    List<Map<String, dynamic>> filteredDistributions = _distributions.where((dist) {
      final date = DateTime.parse(dist['date'] as String);
      if (_selectedStartDate != null && _selectedEndDate != null) {
        return !date.isBefore(_selectedStartDate!) && !date.isAfter(_selectedEndDate!);
      } else if (_selectedStartDate != null) {
        return date.isAtSameMomentAs(_selectedStartDate!);
      }
      return true;
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF8FCF9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8FCF9),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF0E1B12)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Plant Distribution',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0E1B12),
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          // Calendar filter section
          Padding(
            padding: const EdgeInsets.all(16),
            child: Wrap(
              spacing: 24,
              runSpacing: 24,
              alignment: WrapAlignment.center,
              children: [
                Container(
                  constraints: const BoxConstraints(minWidth: 220, maxWidth: 260),
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
                            height: 32,
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
          // Distribution cards (filtered)
          ...filteredDistributions.map((dist) => buildDistributionCard(
                dist['doctor'] as String,
                dist['date'] as String,
                dist['mother'] as String,
                dist['plants'] as Map<String, int>,
              )),
        ],
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
