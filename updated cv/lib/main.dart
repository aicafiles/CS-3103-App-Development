import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My CV',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  void _login() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const CVScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF90C9EF), Color(0xFF003A70)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF003A70),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    ),
                    child: const Text('Login'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CVScreen extends StatefulWidget {
  const CVScreen({super.key});

  @override
  State<CVScreen> createState() => _CVScreenState();
}

class _CVScreenState extends State<CVScreen> {
  File? _profileImage;
  bool _isEditing = false;
  final TextEditingController _goalController = TextEditingController(
    text: 'To achieve career growth and contribute to impactful projects.',
  );
  final TextEditingController _nameController = TextEditingController(
    text: 'Angelica Carandang',
  );
  final TextEditingController _numberController = TextEditingController(
    text: '+63 (976) 125-2854',
  );
  final TextEditingController _emailController = TextEditingController(
    text: 'aicarandang088@gmail.com',
  );

  Future<void> _pickImage() async {
    if (_isEditing) {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          _profileImage = File(pickedFile.path);
        });
      }
    }
  }

  void _editProfile() {
    setState(() {
      _isEditing = true;
    });
  }

  void _saveProfile() {
    setState(() {
      _isEditing = false;
    });
  }

  void _cancelEdit() {
    setState(() {
      _isEditing = false;
      _goalController.text = 'To achieve career growth and contribute to impactful projects.';
      _nameController.text = 'Angelica Carandang';
      _numberController.text = '+63 (976) 125-2854';
      _emailController.text = 'aicarandang088@gmail.com';
    });
  }

  void _logout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Log Out'),
        content: const Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            child: const Text('Log Out'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        elevation: 0,
        title: const Text(
          'My CV',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: _editProfile,
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              color: Colors.lightBlue,
              height: 120,
              width: double.infinity,
              padding: const EdgeInsets.only(left: 16.0),
              alignment: Alignment.centerLeft,
              child: const Text(
                'CV Sections',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.grey[200],
                child: ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: const [
                    ListTile(
                      title: Text('Education'),
                    ),
                    ListTile(
                      title: Text('Skills'),
                    ),
                    ListTile(
                      title: Text('Projects'),
                    ),
                    ListTile(
                      title: Text('Experience'),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Log Out'),
              onTap: _logout,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[200],
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Center(
                child: GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: const Color(0xFF90C9EF),
                    backgroundImage: _profileImage != null ? FileImage(_profileImage!) : null,
                    child: _profileImage == null
                        ? const Text(
                      'AC',
                      style: TextStyle(
                        color: Color(0xFF003A70),
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    )
                        : null,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: TextField(
                  controller: _nameController,
                  readOnly: !_isEditing,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                  decoration: _isEditing
                      ? const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  )
                      : InputDecoration.collapsed(hintText: ''),
                ),
              ),
              const SizedBox(height: 4),
              Center(
                child: TextField(
                  controller: _numberController,
                  readOnly: !_isEditing,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                  decoration: _isEditing
                      ? const InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(),
                  )
                      : InputDecoration.collapsed(hintText: ''),
                ),
              ),
              const SizedBox(height: 3),
              Center(
                child: TextField(
                  controller: _emailController,
                  readOnly: !_isEditing,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                  decoration: _isEditing
                      ? const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  )
                      : InputDecoration.collapsed(hintText: ''),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Professional Goal',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _goalController,
                      readOnly: !_isEditing,
                      maxLines: 4,
                      decoration: _isEditing
                          ? const InputDecoration(
                        hintText: 'Your career goals',
                        border: OutlineInputBorder(),
                      )
                          : InputDecoration.collapsed(hintText: ''),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _isEditing
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _saveProfile,
                    child: const Text('Save'),
                  ),
                  ElevatedButton(
                    onPressed: _cancelEdit,
                    child: const Text('Cancel'),
                  ),
                ],
              )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
