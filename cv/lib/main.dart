import 'package:flutter/material.dart';

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
      home: const CVScreen(),
    );
  }
}

class CVScreen extends StatelessWidget {
  const CVScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        elevation: 0,
        title: const Text('My CV', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
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
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.left,
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
          ],
        ),
      ),
      body: Container(
        color: Colors.grey[200],
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Color(0xFF90C9EF),
                child: Text(
                  'AC',
                  style: TextStyle(
                    color: Color(0xFF003A70),
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                'Angelica Carandang',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Center(
              child: Text(
                '+63 (976) 125-2854',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            const Center(
              child: Text(
                'aicarandang088@gmail.com',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                ),
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
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Professional Goal',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EducationScreen extends StatelessWidget {
  const EducationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Education'),
      ),
      body: Container(
        color: Colors.grey[200],
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(16.0),
        child: const Center(
          child: Text('', style: TextStyle(fontSize: 24)),
        ),
      ),
    );
  }
}

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skills'),
      ),
      body: Container(
        color: Colors.grey[200],
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(16.0),
        child: const Center(
          child: Text('', style: TextStyle(fontSize: 24)), // No content
        ),
      ),
    );
  }
}

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects'),
      ),
      body: Container(
        color: Colors.grey[200],
        child: const Center(child: Text('', style: TextStyle(fontSize: 24))),
      ),
    );
  }
}

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Experience'),
      ),
      body: Container(
        color: Colors.grey[200],
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(16.0),
        child: const Center(
          child: Text('', style: TextStyle(fontSize: 24)),
        ),
      ),
    );
  }
}
