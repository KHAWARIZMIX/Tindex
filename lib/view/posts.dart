import 'package:flutter/material.dart';
import 'package:tindex/componnents/post_card.dart';
import 'package:tindex/services/api.dart';
import 'package:tindex/componnents/blog_title.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  late Future<List<dynamic>> _posts;
  final Future<Map<String, dynamic>> _settings = ghostService.fetchSettings();

  @override
  void initState() {
    super.initState();
    _posts = ghostService.fetchPosts();
  }

  bool _isScreenTooSmall(BuildContext context) {
    return MediaQuery.of(context).size.width < 300;
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle:true,
        surfaceTintColor: Colors.transparent,
        title: BlogTitle(
          settingsFuture: _settings,
        ),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _posts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final posts = snapshot.data ?? [];
            return Center(
              child: Container(
                alignment: Alignment.center,
                constraints: const BoxConstraints(maxWidth: 1200),
                margin: const EdgeInsets.all(16),
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context)
                      .copyWith(scrollbars: false),
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).size.width > 1000
                          ? 3 // More columns on larger screens
                          : MediaQuery.of(context).size.width > 700
                              ? 2 // 3 columns for medium screens
                              : 1, // 2 columns for small screens
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      mainAxisExtent: 750,
                    ),
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      final post = posts[index];
                      final author =
                          post['authors'] != null && post['authors'].isNotEmpty
                              ? post['authors'][0]
                              : null;
                      final tags = post['tags'] ?? [];
                      return _isScreenTooSmall(context)
                          ? Center(
                              child: Text(
                                'Opps! Screen width too small to display content!',
                                style: theme.textTheme.h4
                                    .copyWith(color: Colors.blue),
                                textAlign: TextAlign.center,
                              ),
                            )
                          : PostCard(
                              post: post,
                              author: author,
                              tags: tags,
                              theme: theme,
                            );
                    },
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
