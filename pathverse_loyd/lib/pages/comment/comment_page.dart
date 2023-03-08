import 'package:flutter/material.dart';
import 'package:pathverse_loyd/common/theme/app_text_theme.dart';
import 'package:pathverse_loyd/models/comment.dart';
import 'package:pathverse_loyd/models/post.dart';
import 'package:pathverse_loyd/pages/comment/widgets/comment_item.dart';
import 'package:pathverse_loyd/pages/comment/widgets/comment_item_loading.dart';
import 'package:pathverse_loyd/provider/posts_api_provider.dart';

class CommentPage extends StatelessWidget {
  final Post post;
  const CommentPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade800,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
          color: Colors.indigo.shade800,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.indigo.shade800,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.title,
                          style: AppTextTheme.styleW700
                              .copyWith(fontSize: 20, color: Colors.white),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          post.body,
                          style: AppTextTheme.styleW300
                              .copyWith(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.93),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(22),
                          topRight: Radius.circular(22))),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.edit_note,
                                color: Colors.black54,
                                size: 28,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "All Comments",
                                style: AppTextTheme.styleW700.copyWith(
                                  fontSize: 24,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        FutureBuilder(
                          future: PostsAPIProvider().loadComments(post.id),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return const Center(
                                child: Text('An error has occurred!'),
                              );
                            } else if (snapshot.hasData) {
                              if (snapshot.data!.isEmpty) {
                                return const Center(child: Text("No Comments"));
                              }

                              return Column(
                                children: snapshot.data!
                                    .map((comment) =>
                                        CommentItem(comment: comment))
                                    .toList(),
                              );
                            } else {
                              return Column(
                                children: const [
                                  CommentItemLoading(),
                                  CommentItemLoading(),
                                  CommentItemLoading(),
                                  CommentItemLoading(),
                                  CommentItemLoading()
                                ],
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
