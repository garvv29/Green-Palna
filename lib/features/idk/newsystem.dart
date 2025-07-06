import 'package:flutter/material.dart';
import 'frontpage.dart';

// DatePickerTextField widget for picking date of birth
class DatePickerTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final bool showConfirmCheckbox;
  const DatePickerTextField({
    required this.label,
    required this.controller,
    this.showConfirmCheckbox = true,
    Key? key,
  }) : super(key: key);

  @override
  State<DatePickerTextField> createState() => _DatePickerTextFieldState();
}

class _DatePickerTextFieldState extends State<DatePickerTextField> {
  // Removed unused _isHovering
  bool _isFocused = false;
  late FocusNode _focusNode;
  bool _confirmed = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      if (mounted) setState(() => _isFocused = _focusNode.hasFocus);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate:
          DateTime.tryParse(widget.controller.text) ?? DateTime(2000, 1, 1),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      helpText: 'Select Date of Birth',
      fieldLabelText: 'Date of Birth',
    );
    if (picked != null) {
      widget.controller.text =
          "${picked.day.toString().padLeft(2, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.year}";
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = _isFocused
        ? const Color(0xFF178a3d) // Green when focused
        : Colors.black; // Black when not focused
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.ease,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 8.0,
                offset: const Offset(0, 2),
              ),
            ],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              TextFormField(
                controller: widget.controller,
                focusNode: _focusNode,
                readOnly: true,
                onTap: _pickDate,
                decoration: InputDecoration(
                  label: RichText(
                    text: TextSpan(
                      text: widget.label,
                      style: TextStyle(
                        color: _isFocused
                            ? const Color(0xFF178a3d)
                            : Colors.black54,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      children: const [
                        TextSpan(
                          text: ' *',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  labelStyle: TextStyle(
                    color: _isFocused
                        ? const Color(0xFF178a3d)
                        : Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                  floatingLabelStyle: TextStyle(
                    color: _isFocused
                        ? const Color(0xFF178a3d)
                        : Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: borderColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color(0xFF178a3d),
                      width: 2,
                    ),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFe8f8ec),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 16,
                  ),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.calendar_today,
                          color: Color(0xFF178a3d),
                        ),
                        onPressed: _pickDate,
                        tooltip: 'Select date',
                      ),
                      if (widget.controller.text.isNotEmpty)
                        const Icon(
                          Icons.check_circle,
                          color: Color(0xFF22c55e),
                        ),
                    ],
                  ),
                ),
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
        if (widget.showConfirmCheckbox)
          Padding(
            padding: const EdgeInsets.only(left: 4, top: 2, bottom: 2),
            child: Row(
              children: [
                Checkbox(
                  value: _confirmed,
                  onChanged: (val) {
                    setState(() => _confirmed = val ?? false);
                  },
                  activeColor: const Color(0xFF22c55e),
                  visualDensity: VisualDensity.compact,
                ),
                const Text(
                  'I confirm this detail',
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
          ),
        const SizedBox(height: 16),
      ],
    );
  }
}

// Modular, sectioned registration form with navbar and sections
class LocalWorkerProfileFormScreen extends StatefulWidget {
  final String headerTitle;
  const LocalWorkerProfileFormScreen({Key? key, required this.headerTitle})
    : super(key: key);

  @override
  State<LocalWorkerProfileFormScreen> createState() =>
      _LocalWorkerProfileFormScreenState();
}

class _LocalWorkerProfileFormScreenState
    extends State<LocalWorkerProfileFormScreen>
    with SingleTickerProviderStateMixin {
  // Section completion and confirmation
  bool _personalComplete = false;
  bool _contactComplete = false;
  // bool _workComplete = false; // Not needed, remove to fix error 214
  bool _finalConfirm = false;
  bool _sameAsPrimary = false;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Custom AppBar with border radius
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF22c55e),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 8.0,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Back button
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                  tooltip: 'Back',
                ),
                // Three-dot menu on the left
                PopupMenuButton<int>(
                  icon: const Icon(Icons.more_vert, color: Colors.white),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 1,
                      child: ListTile(
                        leading: const Icon(
                          Icons.help_outline,
                          color: Color(0xFF22c55e),
                        ),
                        title: const Text('Help'),
                      ),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: ListTile(
                        leading: const Icon(
                          Icons.support_agent,
                          color: Color(0xFF22c55e),
                        ),
                        title: const Text('Support'),
                      ),
                    ),
                  ],
                  onSelected: (value) {
                    if (value == 1) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Help'),
                          content: const Text(
                            'For assistance, please refer to the user manual or contact your supervisor.',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('Close'),
                            ),
                          ],
                        ),
                      );
                    } else if (value == 2) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Support'),
                          content: const Text(
                            'For support, email support@greencradle.org or call 1800-123-456.',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('Close'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(width: 8),
                // Title in the center
                Expanded(
                  child: Center(
                    child: Text(
                      widget.headerTitle,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
                // Logo at top right in a circle (custom PNG from user)
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/green_cradle_logo.png',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Icon(Icons.image, color: Color(0xFF22c55e)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xFFF4FFF7), // very light green
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Removed duplicate title - title is already in AppBar
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 8),
            child: Text(
              'Please fill in your official details below.',
              style: TextStyle(fontSize: 15, color: Colors.grey[800]),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.zero,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildPersonalSection(),
                  _buildContactSection(),
                  _buildWorkSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Controllers for each field in each section
  final _personalControllers = List.generate(8, (_) => TextEditingController());
  final _contactControllers = List.generate(5, (_) => TextEditingController());
  final _workControllers = List.generate(11, (_) => TextEditingController());
  
  // Role selection for government officials
  String? _selectedRole;

  // For Aadhar card image upload
  String? _aadharImagePath;
  String? _aadharFileError;

  Widget _buildPersonalSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: 'Personal Information'),
          CustomTextField(
            label: 'Full Name',
            controller: _personalControllers[0],
            showConfirmCheckbox: false,
          ),
          CustomTextField(
            label: 'Father/Husband Name',
            controller: _personalControllers[1],
            showConfirmCheckbox: false,
          ),
          DatePickerTextField(
            label: 'Date of Birth',
            controller: _personalControllers[2],
            showConfirmCheckbox: false,
          ),
          // Combined Aadhar card number and upload in a single box with matching border and style
          AadharCardBox(
            controller: _personalControllers[3],
            aadharImagePath: _aadharImagePath,
            aadharFileError: _aadharFileError,
            onUploadPressed: () async {
              final picked = await showDialog<Map<String, dynamic>>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Simulate Aadhar Upload'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context, {
                          'name': 'aadhar_sample.pdf',
                          'size': 4.5 * 1024 * 1024,
                        }),
                        child: const Text('PDF (4.5 MB)'),
                      ),
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context, {
                          'name': 'aadhar_sample.jpeg',
                          'size': 2.1 * 1024 * 1024,
                        }),
                        child: const Text('JPEG (2.1 MB)'),
                      ),
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context, {
                          'name': 'aadhar_sample.png',
                          'size': 1.2 * 1024 * 1024,
                        }),
                        child: const Text('PNG (1.2 MB) (Invalid)'),
                      ),
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context, {
                          'name': 'aadhar_sample.pdf',
                          'size': 6.2 * 1024 * 1024,
                        }),
                        child: const Text('PDF (6.2 MB) (Too Large)'),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, null),
                      child: const Text('Cancel'),
                    ),
                  ],
                ),
              );
              if (picked != null) {
                final String name = picked['name'] as String;
                final double size = picked['size'] as double;
                final ext = name.toLowerCase().split('.').last;
                if (!(ext == 'pdf' || ext == 'jpeg' || ext == 'jpg')) {
                  setState(() {
                    _aadharFileError = 'Only PDF or JPEG files are allowed.';
                    _aadharImagePath = null;
                  });
                  return;
                }
                if (size > 5 * 1024 * 1024) {
                  setState(() {
                    _aadharFileError = 'File size must be less than 5 MB.';
                    _aadharImagePath = null;
                  });
                  return;
                }
                setState(() {
                  _aadharImagePath = name;
                  _aadharFileError = null;
                });
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: 'Contact Details', icon: Icons.phone),
          CustomTextField(
            label: 'Mobile Number (10 digit)',
            controller: _contactControllers[0],
            showConfirmCheckbox: false,
            maxLength: 10,
            digitValidationMessage: 'Mobile number should be exactly 10 digits',
          ),
          CustomTextField(
            label: 'Alternate Mobile Number',
            controller: _contactControllers[1],
            showConfirmCheckbox: false,
            isOptional: true,
          ),
          CustomTextField(
            label: 'Email (Optional)',
            controller: _contactControllers[2],
            isOptional: true,
            showConfirmCheckbox: false,
          ),
          CustomTextField(
            label: 'Current Address',
            controller: _contactControllers[3],
            showConfirmCheckbox: false,
          ),
          CustomTextField(
            label: 'Permanent Address',
            controller: _contactControllers[4],
            showConfirmCheckbox: false,
          ),
          // Checkbox for "Same as Current Address" can be added here
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildWorkSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: 'Work Details'),
          // Role selection for government officials
          if (widget.headerTitle.contains('Government Official'))
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Role Type *',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFe8f8ec),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _selectedRole,
                        hint: Text(
                          'Select your role',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                        isExpanded: true,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        items: const [
                          DropdownMenuItem(
                            value: 'local_worker',
                            child: Text('Local Worker'),
                          ),
                          DropdownMenuItem(
                            value: 'official',
                            child: Text('Official'),
                          ),
                        ],
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedRole = newValue;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          CustomTextField(
            label: 'Village Code / Ward Number',
            controller: _workControllers[0],
            showConfirmCheckbox: false,
          ),
          CustomTextField(
            label: 'Sector',
            controller: _workControllers[1],
            showConfirmCheckbox: false,
          ),
          CustomTextField(
            label: 'District',
            controller: _workControllers[2],
            showConfirmCheckbox: false,
          ),
          CustomTextField(
            label: 'Worker ID (if assigned)',
            controller: _workControllers[3],
            showConfirmCheckbox: false,
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Row(
              children: [
                Checkbox(
                  value: _finalConfirm,
                  onChanged: (val) {
                    setState(() => _finalConfirm = val ?? false);
                  },
                  activeColor: const Color(0xFF22c55e),
                  visualDensity: VisualDensity.compact,
                ),
                const Text(
                  'I confirm all details',
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  // Reset all controllers and state
                  for (final c in _personalControllers) c.clear();
                  for (final c in _contactControllers) c.clear();
                  for (final c in _workControllers) c.clear();
                  setState(() {
                    _personalComplete = false;
                    _contactComplete = false;
                    _finalConfirm = false;
                    _aadharImagePath = null;
                    _aadharFileError = null;
                    _selectedRole = null;
                  });
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('Form reset.')));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  shape: const StadiumBorder(),
                  minimumSize: const Size(120, 50),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  elevation: 1,
                ),
                icon: const Icon(Icons.cancel, color: Colors.black),
                label: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton.icon(
                onPressed: () {
                  // Validate all requirements before submitting
                  if (!_personalComplete) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please complete the Personal section.'),
                      ),
                    );
                    return;
                  }
                  if (!_contactComplete) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please complete the Contact section.'),
                      ),
                    );
                    return;
                  }
                  // Check role selection for government officials
                  if (widget.headerTitle.contains('Government Official') && _selectedRole == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please select your role type.'),
                      ),
                    );
                    return;
                  }
                  if (!_workControllers.every(
                    (c) => c.text.trim().isNotEmpty,
                  )) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please fill all Work Details fields.'),
                      ),
                    );
                    return;
                  }
                  if (!_finalConfirm) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Please confirm all details before submitting.',
                        ),
                      ),
                    );
                    return;
                  }
                  // All checks passed
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Registration Submitted!')),
                  );
                  // Optionally reset form or navigate
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF178a3d),
                  shape: const StadiumBorder(),
                  minimumSize: const Size(140, 50),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 16,
                  ),
                  elevation: 2,
                ),
                icon: const Icon(Icons.check, color: Colors.white),
                label: const Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// --- SectionHeader ---
class SectionHeader extends StatelessWidget {
  final String title;
  final IconData? icon;
  const SectionHeader({required this.title, this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    // Section header: white background, black text
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          color: Colors.white,
          elevation: 2,
          margin: const EdgeInsets.only(bottom: 8, top: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
            child: Row(
              children: [
                if (icon != null) ...[
                  Icon(icon, color: Colors.black, size: 28),
                  const SizedBox(width: 10),
                ],
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                      color: Colors.black,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 2,
          width: 60,
          margin: const EdgeInsets.only(left: 8, bottom: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}

class CustomTextField extends StatefulWidget {
  final String label;
  final bool isPassword;
  final TextEditingController? controller;
  final bool isOptional;
  final bool showConfirmCheckbox;
  final int? maxLength;
  final String? digitValidationMessage;

  const CustomTextField({
    super.key,
    required this.label,
    this.isPassword = false,
    this.controller,
    this.isOptional = false,
    this.showConfirmCheckbox = true,
    this.maxLength,
    this.digitValidationMessage,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  // Removed unused _isHovering
  bool _isFocused = false;
  TextEditingController? _internalController;
  late FocusNode _focusNode;
  bool _confirmed = false;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _internalController = TextEditingController();
    }
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      if (mounted) setState(() => _isFocused = _focusNode.hasFocus);
    });
  }

  @override
  void dispose() {
    _internalController?.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _validate(String value) {
    if (widget.maxLength != null && value.isNotEmpty) {
      if (value.length != widget.maxLength) {
        setState(() {
          _errorText = widget.digitValidationMessage ?? 'Invalid length';
        });
        return;
      }
    }
    setState(() {
      _errorText = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = _isFocused ? const Color(0xFF178a3d) : Colors.black;
    final controller = widget.controller ?? _internalController!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.ease,
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5), // Light grey background
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.07),
                blurRadius: 10.0,
                offset: const Offset(0, 2),
              ),
            ],
            borderRadius: BorderRadius.circular(10), // More rounded corners
          ),
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              TextFormField(
                controller: controller,
                focusNode: _focusNode,
                obscureText: widget.isPassword,
                keyboardType: widget.maxLength != null
                    ? TextInputType.number
                    : null,
                maxLength: widget.maxLength,
                onChanged: (val) {
                  setState(() {});
                  _validate(val);
                },
                decoration: InputDecoration(
                  label: widget.isOptional
                      ? Text(widget.label)
                      : RichText(
                          text: TextSpan(
                            text: widget.label,
                            style: TextStyle(
                              color: _isFocused
                                  ? const Color(0xFF178a3d)
                                  : Colors.black54,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                            children: const [
                              TextSpan(
                                text: ' *',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                  labelStyle: TextStyle(
                    color: _isFocused
                        ? const Color(0xFF178a3d)
                        : Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                  floatingLabelStyle: TextStyle(
                    color: _isFocused
                        ? const Color(0xFF178a3d)
                        : Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: borderColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color(0xFF178a3d),
                      width: 2,
                    ),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFF5F5F5), // Light grey background
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 16,
                  ),
                  suffixIcon: (controller.text.isNotEmpty)
                      ? const Icon(Icons.check_circle, color: Color(0xFF22c55e))
                      : null,
                  errorText: _errorText,
                  counterText: '',
                ),
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
        if (widget.showConfirmCheckbox)
          Padding(
            padding: const EdgeInsets.only(left: 4, top: 2, bottom: 2),
            child: Row(
              children: [
                Checkbox(
                  value: _confirmed,
                  onChanged: (val) {
                    setState(() => _confirmed = val ?? false);
                  },
                  activeColor: const Color(0xFF22c55e),
                  visualDensity: VisualDensity.compact,
                ),
                const Text(
                  'I confirm this detail',
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
          ),
        const SizedBox(height: 16),
      ],
    );
  }
}

// --- AadharCardBox widget ---
class AadharCardBox extends StatefulWidget {
  final TextEditingController controller;
  final String? aadharImagePath;
  final String? aadharFileError;
  final VoidCallback onUploadPressed;
  const AadharCardBox({
    required this.controller,
    required this.aadharImagePath,
    required this.aadharFileError,
    required this.onUploadPressed,
    Key? key,
  }) : super(key: key);

  @override
  State<AadharCardBox> createState() => _AadharCardBoxState();
}

class _AadharCardBoxState extends State<AadharCardBox> {
  // Removed unused _isHovering
  bool _isFocused = false;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      if (mounted) setState(() => _isFocused = _focusNode.hasFocus);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = _isFocused
        ? const Color(0xFF178a3d) // Green when focused
        : Colors.black; // Black when not focused
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.ease,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5), // Light grey background
        borderRadius: BorderRadius.circular(10), // More rounded corners
        border: Border.all(color: borderColor, width: _isFocused ? 2 : 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 10.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.credit_card, color: Color(0xFF178a3d)),
              const SizedBox(width: 8),
              Expanded(
                child: TextFormField(
                  controller: widget.controller,
                  focusNode: _focusNode,
                  maxLength: 12,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Aadhar Card Number',
                    counterText: '',
                    border: InputBorder.none,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    suffixIcon: null,
                  ),
                  style: const TextStyle(color: Color(0xFF178a3d)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              ElevatedButton.icon(
                icon: const Icon(Icons.upload_file, color: Color(0xFF178a3d)),
                label: Text(
                  widget.aadharImagePath == null
                      ? 'Upload Aadhar Card'
                      : 'Change File',
                  style: const TextStyle(color: Color(0xFF178a3d)),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 0,
                  side: BorderSide(
                    color: _isFocused ? const Color(0xFF178a3d) : Colors.black,
                  ),
                ),
                onPressed: widget.onUploadPressed,
              ),
              const SizedBox(width: 12),
              if (widget.aadharImagePath != null)
                Row(
                  children: [
                    const Icon(Icons.check_circle, color: Color(0xFF22c55e)),
                    const SizedBox(width: 4),
                    Text(
                      'Uploaded',
                      style: TextStyle(
                        color: Color(0xFF178a3d),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
            ],
          ),
          if (widget.aadharFileError != null)
            Padding(
              padding: const EdgeInsets.only(top: 4, left: 4),
              child: Text(
                widget.aadharFileError!,
                style: const TextStyle(color: Colors.red, fontSize: 13),
              ),
            ),
        ],
      ),
    );
  }
}

// --- Progress Indicator ---
class StepProgressBar extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  const StepProgressBar({
    required this.currentStep,
    required this.totalSteps,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: LinearProgressIndicator(
              value: currentStep / totalSteps,
              backgroundColor: const Color(0xFFE8F8EC),
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0xFF22c55e),
              ),
              minHeight: 8,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            'Step $currentStep of $totalSteps',
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Color(0xFF178a3d),
            ),
          ),
        ],
      ),
    );
  }
}

// --- Checkbox Theme ---
class ThemedCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  const ThemedCheckbox({required this.value, required this.onChanged, Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.35,
      child: Checkbox(
        value: value,
        onChanged: onChanged,
        activeColor: const Color(0xFF22c55e),
        checkColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        side: const BorderSide(width: 2, color: Color(0xFF178a3d)),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
      ),
    );
  }
}
