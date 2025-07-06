import 'package:flutter/material.dart';

class NewRecordFormExtended extends StatefulWidget {
  const NewRecordFormExtended({super.key});

  @override
  State<NewRecordFormExtended> createState() => _NewRecordFormExtendedState();
}

class _NewRecordFormExtendedState extends State<NewRecordFormExtended> {
  String? _bloodGroup;
  final List<String> _bloodGroups = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
  ];
  String? _deliveryType;
  final List<String> _deliveryTypes = ['Normal', 'C-Section', 'Other'];
  final TextEditingController _motherName = TextEditingController();
  final TextEditingController _contact = TextEditingController();
  final TextEditingController _deliveryDate = TextEditingController();
  final TextEditingController _fatherName = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _deliveryAddress = TextEditingController();
  // Hospital Address fields
  final TextEditingController _hospitalCity = TextEditingController();
  final TextEditingController _hospitalDistrict = TextEditingController();
  final TextEditingController _hospitalPincode = TextEditingController();
  // Patient Address fields
  final TextEditingController _patientCity = TextEditingController();
  final TextEditingController _patientDistrict = TextEditingController();
  final TextEditingController _patientPincode = TextEditingController();

  // Plant selection logic: allow up to 5 in total, show counters for each
  final Map<String, int> _plantCounts = {
    'Mango': 0,
    'Drumsticks': 0,
    'Guava': 0,
    'Indian Gooseberry': 0,
    'Papaya': 0,
  };
  int get _totalPlantsSelected => _plantCounts.values.fold(0, (a, b) => a + b);
  void _incrementPlant(String plant) {
    if (_totalPlantsSelected < 5) {
      setState(() {
        _plantCounts[plant] = (_plantCounts[plant] ?? 0) + 1;
      });
    }
    if (_totalPlantsSelected >= 5) {
      final currentContext = context;
      Future.delayed(Duration.zero, () {
        if (currentContext.mounted) {
          showDialog(
            context: currentContext,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Limit Exceeded'),
                content: const Text('You cannot select more than 5 plants in total.'),
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
      });
    }
  }

  void _decrementPlant(String plant) {
    if ((_plantCounts[plant] ?? 0) > 0) {
      setState(() {
        _plantCounts[plant] = (_plantCounts[plant] ?? 0) - 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF22C55E),
        elevation: 0,
        title: const Text(
          'New Record Form',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            letterSpacing: -0.015,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).maybePop();
          },
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section 1: Personal Info
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Personal Info",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            const SizedBox(height: 8),
            _buildTextField("Mother's Name *", _motherName),
            _buildTextField("Father/Husband Name *", _fatherName),
            _buildTextField("Contact Information *", _contact),
            const SizedBox(height: 20),

            // Section 2: Delivery Details
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Delivery Details",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            const SizedBox(height: 8),
            _buildTextField("Delivery Date *", _deliveryDate),
            _buildDropdown("Delivery Type *", _deliveryTypes, _deliveryType, (
              value,
            ) {
              setState(() => _deliveryType = value);
            }),
            _buildDropdown("Blood Group *", _bloodGroups, _bloodGroup, (value) {
              setState(() => _bloodGroup = value);
            }),
            const SizedBox(height: 20),

            // Section 3: Hospital Address
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Hospital Address",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            const SizedBox(height: 8),
            _buildTextField("Address *", _address),
            _buildTextField("City *", _hospitalCity),
            _buildTextField("District *", _hospitalDistrict),
            _buildTextField("Pincode *", _hospitalPincode),
            const SizedBox(height: 20),

            // Section 4: Patient Address
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Patient Address",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            const SizedBox(height: 8),
            _buildTextField("Address *", _deliveryAddress),
            _buildTextField("City *", _patientCity),
            _buildTextField("District *", _patientDistrict),
            _buildTextField("Pincode *", _patientPincode),
            const SizedBox(height: 20),

            // Pledge Plants Section
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Pledge Plants",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ..._plantCounts.keys.map((plant) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: (_totalPlantsSelected < 5)
                            ? () => _incrementPlant(plant)
                            : null,
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                ),
                                child: Text(
                                  plant,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.remove_circle_outline,
                                color: Color(0xFF22C55E),
                              ),
                              onPressed: _plantCounts[plant]! > 0
                                  ? () => _decrementPlant(plant)
                                  : null,
                            ),
                            Container(
                              width: 28,
                              alignment: Alignment.center,
                              child: Text(
                                _plantCounts[plant].toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.add_circle_outline,
                                color: Color(0xFF22C55E),
                              ),
                              onPressed: (_totalPlantsSelected < 5)
                                  ? () => _incrementPlant(plant)
                                  : null,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                  if (_totalPlantsSelected >= 5)
                    const Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        "You can select up to 5 plants only.",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Pledge Photo Section
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Pledge Photo",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Upload Pledge Photo",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Capture and upload the photo of the pledge.",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Upload",
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      title: const Text(
                        'Record Submitted',
                        style: TextStyle(
                          color: Color(0xFF22C55E),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mother Name: ${_motherName.text}',
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Username: user_${_motherName.text.replaceAll(' ', '').toLowerCase()}',
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Password: 123456',
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: const Color(0xFF22C55E),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },
                          child: const Text('Close'),
                        ),
                      ],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF14cc14),
                ),
                child: const Text(
                  "Submit",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        style: const TextStyle(fontWeight: FontWeight.w400),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(fontWeight: FontWeight.w400),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.grey, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF22C55E), width: 2),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.grey, width: 1),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown(
    String label,
    List<String> items,
    String? selected,
    ValueChanged<String?> onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(fontWeight: FontWeight.w400),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 4,
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: _AnimatedDropdown<String>(
              value: selected,
              isExpanded: true,
              onChanged: onChanged,
              items: items
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                        style: const TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );

    // Custom animated dropdown widget
  }
}

class _AnimatedDropdown<T> extends StatefulWidget {
  final T? value;
  final List<DropdownMenuItem<T>>? items;
  final ValueChanged<T?>? onChanged;
  final bool isExpanded;
  const _AnimatedDropdown({
    super.key,
    this.value,
    this.items,
    this.onChanged,
    this.isExpanded = false,
  });

  @override
  State<_AnimatedDropdown<T>> createState() => _AnimatedDropdownState<T>();
}

class _AnimatedDropdownState<T> extends State<_AnimatedDropdown<T>>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnim;
  // bool _isOpen = false; // Removed unused field
  final GlobalKey _dropdownKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 220),
    );
    _scaleAnim = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // Null safety: fallback to default dropdown if not ready
        if (_dropdownKey.currentContext == null ||
            _dropdownKey.currentContext!.findRenderObject() == null ||
            _dropdownKey.currentContext!.findRenderObject() is! RenderBox) {
          // fallback: open default dropdown
          return;
        }
        final RenderBox box =
            _dropdownKey.currentContext!.findRenderObject() as RenderBox;
        final Offset offset = box.localToGlobal(Offset.zero);
        // setState(() => _isOpen = true); // Removed unused field
        _controller.forward();
        final value = await showGeneralDialog<T>(
          context: context,
          barrierDismissible: true,
          barrierLabel: '',
          transitionDuration: const Duration(milliseconds: 220),
          pageBuilder: (context, anim1, anim2) {
            return const SizedBox.shrink();
          },
          transitionBuilder: (context, anim1, anim2, child) {
            return Stack(
              children: [
                Positioned(
                  left: offset.dx,
                  top: offset.dy + box.size.height,
                  width: box.size.width,
                  child: ScaleTransition(
                    scale: _scaleAnim,
                    alignment: Alignment.topCenter,
                    child: Material(
                      elevation: 8,
                      borderRadius: BorderRadius.circular(12),
                      child: ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        children: (widget.items ?? []).map((item) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).pop(item.value);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              child: item.child,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
        if (value != null && widget.onChanged != null) widget.onChanged!(value);
        _controller.reverse();
        // setState(() => _isOpen = false); // Removed unused field
      },
      child: Container(
        key: _dropdownKey,
        child: DropdownButton<T>(
          value: widget.value,
          items: widget.items,
          onChanged: widget.onChanged,
          isExpanded: widget.isExpanded,
        ),
      ),
    );
  }
}
