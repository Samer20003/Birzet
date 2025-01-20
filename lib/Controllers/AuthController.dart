import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  final String baseUrl = "http://localhost:4000/api/v1/auth"; // Adjust based on your API endpoint

  // Sign Up method
  Future<Map<String, dynamic>> signup(String name, String email,String password,   File? image, // ملف الصورة
      ) async {
    final url = Uri.parse('$baseUrl/signup');
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(
          {'name': name,
            'email': email,
            'password': password,



          }),
    );

    if (response.statusCode == 201) {
      return {'success': true, 'message': jsonDecode(response.body)['message']};
    } else {
      return {'success': false, 'message': jsonDecode(response.body)['message']};
    }

    // if (image != null) {
    //   request.files.add(await http.MultipartFile.fromPath(
    //     'image', // المفتاح المستخدم في الباك اند لاستقبال الصورة
    //     image.path,
    //   ));
    // }


  }



  // Login method
  Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/login');
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      // Parse token and save it locally
      final token = jsonDecode(response.body)['token'];
      _saveToken(token);
      return {'success': true, 'message': 'Login successful'};
    } else {
      return {'success': false, 'message': jsonDecode(response.body)['message']};
    }
  }

  // Save token to SharedPreferences
  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('auth_token', token);
  }

  // Get saved token
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  // Logout method (clear token)
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('auth_token');
  }
}
