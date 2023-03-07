import 'package:flutter/material.dart';
import 'package:pathverse_loyd/common/theme/app_text_theme.dart';
import 'package:pathverse_loyd/models/comment.dart';
import 'package:pathverse_loyd/models/post.dart';
import 'package:pathverse_loyd/pages/comment/widgets/comment_item.dart';
import 'package:pathverse_loyd/provider/posts_api_provider.dart';

class CommentPage extends StatefulWidget {
  final Post post;
  const CommentPage({super.key, required this.post});

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  List<Comment> comments = [];
  @override
  void initState() {
    super.initState();
    loadComments();
  }

  loadComments() async {
    final postsAPIProvider = PostsAPIProvider();
    comments = await postsAPIProvider.loadComments(widget.post.id);
    setState(() {});
  }

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
                          widget.post.title,
                          style: AppTextTheme.styleW700
                              .copyWith(fontSize: 20, color: Colors.white),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.post.body,
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
                              SizedBox(
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
                        comments.isEmpty
                            ? Center(child: CircularProgressIndicator())
                            : Column(
                                children: comments
                                    .map((comment) =>
                                        CommentItem(comment: comment))
                                    .toList(),
                              )
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
