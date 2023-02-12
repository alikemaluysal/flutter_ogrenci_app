import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ogrenci_app/pages/messages_page.dart';
import 'package:ogrenci_app/pages/students_page.dart';
import 'package:ogrenci_app/pages/teachers_page.dart';
import 'package:ogrenci_app/repositories/messages_repository.dart';
import 'package:ogrenci_app/repositories/students_repository.dart';
import 'package:ogrenci_app/repositories/teachers_repository.dart';

void main() {
  runApp(const ProviderScope(child: const StudentApp()));
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
      home:  HomePage(title: 'Öğrenci Uygulaması Ana Sayfa'),
    );
  }
}

class HomePage extends ConsumerWidget {
  HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentsRepository = ref.watch(studentsProvider);
    final teachersRepository =  ref.watch(teachersProvider);
    final messagesRepository =  ref.watch(messagesProvider);
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
                    return const StudentsPage();
                  },
                ));
              },
            ),
            ListTile(
              title: const Text('Öğretmenler'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const TeachersPage();
                  },
                ));
              },
            ),
            ListTile(
              title: const Text('Mesajlar'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const MessagesPage();
                  },
                ));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return const StudentsPage();
                      },
                    ));
                  },
                  child: Text("${studentsRepository.students.length} Öğrenci")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return const TeachersPage();
                      },
                    ));
                  },
                  child: Text("${teachersRepository.teachers.length} Öğretmen")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return const MessagesPage();
                      },
                    ));
                  },
                  child: Text("${ref.watch(newMessageCountProvider)} yeni mesaj"))
            ],
          ),
        ),
      );
  }
}
