import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BlogTitle extends StatelessWidget {
  final Future<Map<String, dynamic>> settingsFuture;

  const BlogTitle({super.key, required this.settingsFuture});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: settingsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Failed to load settings'));
        } else if (snapshot.hasData) {
          // Access the nested settings key
          final settings = snapshot.data!['settings'];

          // Debug: Check the data structure
          if (kDebugMode) {
            print('Settings Data: $settings');
          }

          // Safely retrieve logo and title
          final String title = settings['title'] ?? 'Ghost';

          return InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '$title ', // The title with a space
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const TextSpan(
                    text: 'Blog', // The "Blog" part
                    style: TextStyle(
                      fontSize: 18, // A different size
                      fontWeight: FontWeight.normal,
                      color: Colors.blue, // A different color
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Center(child: Text('No data available'));
        }
      },
    );
  }
}
