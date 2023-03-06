import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pathverse_loyd/models/post.dart';
import 'package:pathverse_loyd/pages/home_landing/widgets/post_item.dart';

class UserPage extends StatefulWidget {
  final int userId;
  const UserPage({super.key, required this.userId});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List<Post> recentPosts = [];
  @override
  void initState() {
    super.initState();
    loadRecentPosts();
  }

  loadRecentPosts() async {
    final response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/users/${widget.userId}/posts'));

    if (response.statusCode == 200) {
      final List<dynamic> result = jsonDecode(response.body);

      for (var element in result) {
        recentPosts.add(Post.fromJson(element));
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
        elevation: 1,
        title: Text("User${widget.userId}"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Recent Posts",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: recentPosts
                    .map((post) => PostItem(
                          post: post,
                          isShowUserName: false,
                        ))
                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
