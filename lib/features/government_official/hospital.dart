import 'package:flutter/material.dart';

void main() {
  runApp(HospitalDashboard());
}

class HospitalDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hospital Dashboard',
      theme: ThemeData(
        fontFamily: 'Roboto',
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        backgroundColor: Color(0xFFF0F4F8),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 32),
                    Text('Dashboard',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.notifications),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.more_vert),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 20),

                // Hospital Info
                Center(
                  child: Column(
                    children: [
                      Text(
                        'City General Hospital',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800]),
                      ),
                      SizedBox(height: 4),
                      Text('Incharge: Dr. James Anderson',
                          style: TextStyle(color: Colors.grey[600])),
                    ],
                  ),
                ),

                SizedBox(height: 24),

                // Stats
                Row(
                  children: [
                    Expanded(
                      child: StatCard(
                        title: 'Total Workers',
                        value: '150',
                        bgColor: Colors.blue[100]!,
                        textColor: Colors.blue[900]!,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: StatCard(
                        title: 'Total Deliveries',
                        value: '42',
                        bgColor: Colors.green[100]!,
                        textColor: Colors.green[900]!,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 24),

                // Add Worker Button
                ElevatedButton.icon(
                  icon: Icon(Icons.add),
                  label: Text('Add Worker'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: Colors.green[500],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 4,
                  ),
                  onPressed: () {},
                ),

                SizedBox(height: 24),

                // Workers List
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Hospital Workers',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800]),
                  ),
                ),
                SizedBox(height: 16),
                WorkerCard(
                  name: 'Dr. Emily Carter',
                  role: 'Cardiologist',
                  avatarColor: Colors.blue[200]!,
                  iconColor: Colors.blue[600]!,
                ),
                WorkerCard(
                  name: 'Nurse John Doe',
                  role: 'Pediatrics',
                  avatarColor: Colors.green[200]!,
                  iconColor: Colors.green[600]!,
                ),
                WorkerCard(
                  name: 'Dr. Sarah Lee',
                  role: 'Neurologist',
                  avatarColor: Colors.purple[200]!,
                  iconColor: Colors.purple[600]!,
                ),
                WorkerCard(
                  name: 'Mark Brown',
                  role: 'Surgeon',
                  avatarColor: Colors.yellow[200]!,
                  iconColor: Colors.yellow[700]!,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final Color bgColor;
  final Color textColor;

  const StatCard({
    required this.title,
    required this.value,
    required this.bgColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.black12, blurRadius: 4, offset: Offset(2, 2)),
        ],
      ),
      child: Column(
        children: [
          Text(title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: textColor)),
          SizedBox(height: 8),
          Text(value,
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: textColor)),
        ],
      ),
    );
  }
}

class WorkerCard extends StatelessWidget {
  final String name;
  final String role;
  final Color avatarColor;
  final Color iconColor;

  const WorkerCard({
    required this.name,
    required this.role,
    required this.avatarColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.black12, blurRadius: 4, offset: Offset(2, 2)),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: avatarColor,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.person, color: iconColor),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[900])),
                Text(role, style: TextStyle(color: Colors.grey[600])),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.grey[400]),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}