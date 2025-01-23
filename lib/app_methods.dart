import 'dart:convert';

import 'package:internshala_spring_edge/models/university.model.dart';
import 'package:http/http.dart' as http;

abstract class AppMethods {
  static Future<List<University>?> fetchUniversities() async {
    final url =
        Uri.parse('http://universities.hipolabs.com/search?name=middle');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        List<University> universities = [];
        for (var element in data) {
          universities.add(University.fromJson(element));
        }
        return universities;
      } else {
        throw json.decode(response.body);
      }
    } catch (e) {
      rethrow;
    }
  }
}
