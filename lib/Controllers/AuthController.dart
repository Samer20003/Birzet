import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  final String baseUrl = "http://localhost:4000/api/v1/auth"; // Adjust based on your API endpoint


  Future<Map<String, dynamic>> signupWithDio(
      String name,
      String email,
      String password,
      Uint8List? imageBytes,
      String phoneNumber,
      String gender,
      String userType,
      ) async {
    try {
      final dio = Dio();
      final formData = FormData.fromMap({
        'name': name,
        'email': email,
        'password': password,
        'phoneNumber': phoneNumber,
        'gender': gender,
        'userType': userType,
        if (imageBytes!.isNotEmpty)
          'image': MultipartFile.fromBytes(imageBytes,
              filename: 'uploaded_image.jpg'),
      });

      final response = await dio.post(
        'http://localhost:4000/api/v1/auth/signup',
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
      );

      if (response.statusCode == 201) {
        return {
          'success': true,
          'message': response.data['message'] ?? 'Account created successfully',
        };
      } else {
        return {
          'success': false,
          'message': response.data['message'] ?? 'Registration failed',
        };
      }
    } catch (e) {
      return {'success': false, 'message': 'An error occurred: $e'};
    }
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
