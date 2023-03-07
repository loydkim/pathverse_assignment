import 'package:flutter/material.dart';
import 'package:pathverse_loyd/common/theme/app_text_theme.dart';
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
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40))),
        backgroundColor: Colors.indigo.shade800,
        foregroundColor: Colors.white,
        centerTitle: false,
        elevation: 1,
        toolbarHeight: 66,
        title: Text("User${widget.userId}"),
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.edit,
                                size: 18,
                                color: Colors.black54,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text("Recent Posts",
                                  style: AppTextTheme.styleW700.copyWith(
                                    fontSize: 24,
                                    color: Colors.black87,
                                  )),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        ...recentPosts
                            .map((post) => PostItem(
                                  post: post,
                                  isShowUserName: false,
                                ))
                            .toList(),
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
