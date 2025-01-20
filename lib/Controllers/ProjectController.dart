import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProjectController {
  final String baseUrl = "localhost:4000/api/v1/project";

// Add New Project
  Future<Map<String, dynamic>> addNewProject(
      String title,
      String description,
      String current_stage,
      String location,
      String category,
      String image, // Changed parameter to 'image' for consistency
      ) async {
    final url = Uri.parse('$baseUrl/add');
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        'title': title,
        'description': description,
        'current_stage': current_stage,
        'location': location,
        'category': category,
        'image': image, // Fixed the key-value pair here
      }),
    );

    if (response.statusCode == 200) {
      return {'success': true, 'message': jsonDecode(response.body)['message']};
    } else {
      return {'success': false, 'message': jsonDecode(response.body)['message']};
    }
  }








}