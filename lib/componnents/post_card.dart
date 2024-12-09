import 'package:flutter/material.dart';
import 'package:tindex/view/post.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class PostCard extends StatelessWidget {
  const PostCard({
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
    return ShadCard(
      rowMainAxisAlignment: MainAxisAlignment.spaceAround,
      rowCrossAxisAlignment: CrossAxisAlignment.end,
      columnMainAxisAlignment: MainAxisAlignment.center,
      columnCrossAxisAlignment: CrossAxisAlignment.start,
      rowMainAxisSize: MainAxisSize.max,
      columnMainAxisSize: MainAxisSize.min,
      radius: BorderRadius.circular(20),
      title: Text(post['title'], style: theme.textTheme.h4),
      description: const Text(''),
      footer: Row(
        mainAxisAlignment:
            MainAxisAlignment.end, // Aligns children to the end of the Row
        crossAxisAlignment:
            CrossAxisAlignment.end, // Aligns children vertically to the bottom
        children: [
          ShadButton(
            hoverBackgroundColor: Colors.grey,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReadPostPage(
                    post: post,
                    author: author,
                    tags: tags,
                    theme: theme,
                  ),
                ),
              );
            },
            child: Text('Read more', style: theme.textTheme.small),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            post['feature_image'] != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(
                        20.0), // Adjust the radius as needed
                    child: ShadImage<String>(
                      height: 300,
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
                        ),
                      ),
                    ),
                  ),
            ListTile(
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  if (author != null)
                    Row(
                      children: [
                        if (author['profile_image'] != null)
                          ShadAvatar(
                            size: const Size(50, 50),
                            author['profile_image'],
                            placeholder: const Text('CN'),
                          ),
                        const SizedBox(width: 8),
                        Text(author['name']),
                      ],
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    '${post['excerpt']}....', // Use string interpolation for safety
                    maxLines: 3, // Limit the text to 2 lines
                    overflow: TextOverflow
                        .ellipsis, // Ensure text is truncated with ellipsis if it overflows
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 10.0,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const SizedBox(width: 5), // Spacer
                      const Text('Tags: '), // Static text
                      ...tags.map<Widget>((tag) {
                        // Spread operator to include mapped widgets
                        return Chip(label: Text(tag['name']));
                      }).toList(),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
