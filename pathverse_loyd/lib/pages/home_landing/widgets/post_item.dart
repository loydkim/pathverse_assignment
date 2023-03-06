import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pathverse_loyd/models/post.dart';
import 'package:pathverse_loyd/pages/comment/comment_page.dart';
import 'package:pathverse_loyd/pages/user/user_page.dart';

class PostItem extends StatelessWidget {
  final Post post;
  final bool isShowUserName;
  const PostItem({super.key, required this.post, this.isShowUserName = true});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        post.title,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    isShowUserName
                        ? GestureDetector(
                            onTap: () => {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    UserPage(userId: post.userId),
                              ))
                            },
                            child: Text(
                              "User${post.userId.toString()}",
                            ),
                          )
                        : Container(),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  post.body,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Spacer(),
                    GestureDetector(
                      onTap: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CommentPage(post: post),
                        ))
                      },
                      child: Text(
                        "View comments",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
