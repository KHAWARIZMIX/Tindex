import 'package:flutter/material.dart';
import 'package:tindex/view/posts.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp(
      title: 'Tindex',
      debugShowCheckedModeBanner: false,
      darkTheme: ShadThemeData(
        brightness: Brightness.dark,
        colorScheme: const ShadNeutralColorScheme.dark(
    
        ),
        primaryButtonTheme: const ShadButtonTheme(
          backgroundColor: Colors.blue,
        ),
      ),
      home: const PostsPage(),
    );
  }
}
