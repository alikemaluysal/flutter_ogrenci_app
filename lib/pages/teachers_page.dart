import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/teachers_repository.dart';
import 'package:ogrenci_app/models/teacher.dart';


class TeachersPage extends ConsumerWidget {
  const TeachersPage( {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teachersRepository = ref.watch(teachersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Öğretmenler"),
      ),
        body: Column(
          children: [
            PhysicalModel(
              color: Colors.white,
              elevation: 20,
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 32.0),
                      child: Text("${teachersRepository.teachers.length} Öğretmen"),
                    ),
                  ),
                  TeacherDownloadButton()
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index)
                => TeacherRow(teachersRepository.teachers[index]),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: teachersRepository.teachers.length,
              ),
            )
          ],
        ));

  }
}

class TeacherDownloadButton extends StatefulWidget {
  const TeacherDownloadButton({
    super.key,
  });

  @override
  State<TeacherDownloadButton> createState() => _TeacherDownloadButtonState();
}

class _TeacherDownloadButtonState extends State<TeacherDownloadButton> {
   bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return isLoading ? CircularProgressIndicator() : IconButton(onPressed: () async {

          //TODO loading
          //TODO error
          try{
            setState(() {
              isLoading = true;

            });

          await ref.read(teachersProvider).download();
          }
          catch(e){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(e.toString()))
            );
          }
          finally{
          setState(() {
          isLoading = false;
          });
          }

        }, icon: const Icon(Icons.download));
      }
    );
  }
}

class TeacherRow extends StatelessWidget {
  final Teacher teacher;
  const TeacherRow(this.teacher, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("${teacher.firstName} ${teacher.lastName}"),
      leading: Icon(teacher.gender == "Erkek" ? Icons.man : Icons.woman),
    );
  }
}
