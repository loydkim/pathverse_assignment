import 'package:flutter/material.dart';
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
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Container(
          color: Colors.white,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.post.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.post.body,
                  ),
                  const Divider(),
                  Text(
                    "All Comments",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: comments
                        .map((comment) => CommentItem(comment: comment))
                        .toList(),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
