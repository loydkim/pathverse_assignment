import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pathverse_loyd/common/theme/app_text_theme.dart';
import 'package:pathverse_loyd/common/widgets/expandable_text.dart';
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
        padding: const EdgeInsets.all(12.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              boxShadow: [
                BoxShadow(
                    color: Colors.deepPurple.withOpacity(0.14),
                    blurRadius: 7,
                    spreadRadius: 5,
                    offset: Offset(0, 3)),
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                isShowUserName
                    ? OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(
                                width: 0.4, color: Colors.amber.shade900),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            backgroundColor:
                                Colors.amber.shade900.withOpacity(0.15),
                            foregroundColor: Colors.amber.shade900),
                        onPressed: () => {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    UserPage(userId: post.userId),
                              ))
                            },
                        child: Text(
                          "User${post.userId.toString()}",
                        ))
                    : Container(),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  post.title,
                  style: AppTextTheme.styleW700.copyWith(fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
                ),
                ExpandableText(
                  post.body,
                  trimLines: 4,
                ),
                // Text(
                //   post.body,
                // ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CommentPage(post: post),
                        ))
                      },
                      child: Text(
                        "View comments",
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ),
                    const Spacer(),
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
