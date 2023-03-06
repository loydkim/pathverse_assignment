import 'package:flutter/material.dart';
import 'package:pathverse_loyd/models/post.dart';
import 'package:pathverse_loyd/common/widgets/post_item.dart';
import 'package:pathverse_loyd/provider/users_api_provider.dart';

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
    final usersAPIProvider = UsersAPIProvider();
    recentPosts = await usersAPIProvider.loadUserPosts(widget.userId);
    setState(() {});
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
