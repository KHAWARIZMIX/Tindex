import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class GhostService {
  final String baseUrl;
  final String apiKey;

  GhostService({required this.baseUrl, required this.apiKey});

  Future<List<dynamic>> fetchPosts() async {
    final response = await http.get(
      Uri.parse(
          '$baseUrl/ghost/api/content/posts/?key=$apiKey&include=authors,tags'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['posts'];
    } else {
      throw Exception('Failed to load posts');
    }
  }

  Future<Map<String, dynamic>> fetchSettings() async {
    final response = await http.get(
      Uri.parse('$baseUrl/ghost/api/content/settings/?key=$apiKey'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (kDebugMode) {
        print('Fetched Settings: $data');
      } // Log the response to inspect
      return data;
    } else {
      throw Exception('Failed to load settings');
    }
  }
}
