import 'package:flutter/material.dart';
import 'package:ogrenci_app/pages/messages_page.dart';
import 'package:ogrenci_app/pages/students_page.dart';
import 'package:ogrenci_app/pages/teachers_page.dart';
import 'package:ogrenci_app/repositories/messages_repository.dart';
import 'package:ogrenci_app/repositories/students_repository.dart';
import 'package:ogrenci_app/repositories/teachers_repository.dart';

void main() {
  runApp(const StudentApp());
}

class StudentApp extends StatelessWidget {
  const StudentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Öğrenci Uygulaması',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Öğrenci Uygulaması Ana Sayfa'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  var messagesRepository = new MessagesRepository();
  var studentsRepository = new StudentsRepository();
  var teachersRepository = new TeachersRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Öğrenci Adı'),
            ),
            ListTile(
              title: const Text('Öğrenciler'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return StudentsPage(studentsRepository);
                  },
                ));
              },
            ),
            ListTile(
              title: const Text('Öğretmenler'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return TeachersPage(teachersRepository);
                  },
                ));
              },
            ),
            ListTile(
              title: const Text('Mesajlar'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return MessagesPage(messagesRepository);
                  },
                ));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return StudentsPage(studentsRepository);
                      },
                    ));
                  },
                  child: Text("${studentsRepository.students.length} Öğrenci")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return TeachersPage(teachersRepository);
                      },
                    ));
                  },
                  child: Text("${teachersRepository.teachers.length} Öğretmen")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return MessagesPage(messagesRepository);
                      },
                    ));
                  },
                  child: Text("${messagesRepository.messages.length} yeni mesaj"))
            ],
          ),
        ),
      );
  }
}
