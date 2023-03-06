import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pathverse_loyd/models/comment.dart';
import 'package:pathverse_loyd/models/post.dart';
import 'package:pathverse_loyd/pages/comment/widgets/comment_item.dart';

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
    final response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/posts/${widget.post.id}/comments'));

    if (response.statusCode == 200) {
      final List<dynamic> result = jsonDecode(response.body);

      for (var element in result) {
        comments.add(Comment.fromJson(element));
      }

      setState(() {});

      print("finish load Post");
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        // title: Text("User${widget.userId}"),
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
