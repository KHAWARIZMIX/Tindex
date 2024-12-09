import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ReadPostPage extends StatelessWidget {
  const ReadPostPage({
    super.key,
    required this.theme,
    required this.post,
    required this.author,
    required this.tags,
  });

  final ShadThemeData theme;
  final dynamic post;
  final dynamic author;
  final dynamic tags;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          (post['title']),
          style: theme.textTheme.h3,
        ),
        surfaceTintColor: Colors.transparent,
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          constraints: const BoxConstraints(maxWidth: 1200),
          padding: const EdgeInsets.all(16),
          child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                post['feature_image'] != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(
                            20.0), // Adjust the radius as needed
                        child: ShadImage<String>(
                          height: 400,
                          post['feature_image'],
                          fit: BoxFit.cover,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(
                            20.0), // Adjust the radius as needed
                        child: Container(
                          height: 300,
                          color: theme.colorScheme.secondary,
                          child: Center(
                              child: Text(
                            'No cover availavle',
                            style: TextStyle(
                                color:
                                    theme.secondaryButtonTheme.foregroundColor),
                          )),
                        ),
                      ),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        post['excerpt'],
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Wrap(
                        spacing: 10.0,
                        runSpacing: 20.0,
                        runAlignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: [
                          const SizedBox(width: 5), // Spacer
                          const Text('Tags: '), // Static text
                          ...tags.map<Widget>((tag) {
                            // Spread operator to include mapped widgets
                            return Chip(label: Text(tag['name']));
                          }).toList(),

                          if (author != null)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                if (author['profile_image'] != null)
                                  ShadAvatar(
                                    size: const Size(50, 50),
                                    author['profile_image'],
                                    placeholder: const Text('Author'),
                                  ),
                                const SizedBox(width: 8),
                                Text(author['name']),
                              ],
                            ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
