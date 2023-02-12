import 'dart:convert';
import 'dart:core';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ogrenci_app/models/teacher.dart';
import 'package:http/http.dart' as http;

class DataService {
  final String baseUrl = "https://63e901d75f3e35d898f93510.mockapi.io/";

  Future<Teacher> downloadTeacher() async {
    final response = await http.get(Uri.parse("$baseUrl/ogretmen/3"));

    if (response.statusCode == 200) {
      return Teacher.fromMap(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load teacher : ${response.statusCode}');
    }


  }
}

final dataServiceProvider = Provider((ref) {
  return DataService();
});
