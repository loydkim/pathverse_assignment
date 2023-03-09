import 'package:flutter/material.dart';
import 'package:pathverse_loyd/common/theme/app_text_theme.dart';
import 'package:pathverse_loyd/common/widgets/expandable_text.dart';
import 'package:pathverse_loyd/models/post.dart';
import 'package:pathverse_loyd/pages/comment/comment_page.dart';
import 'package:pathverse_loyd/pages/user/user_page.dart';

class PostItem extends StatelessWidget {
  final Post post;
  final Color? color;
  final bool isShowUserName;
  const PostItem(
      {super.key, required this.post, this.isShowUserName = true, this.color});

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
                    color: color?.withOpacity(0.14) ??
                        Colors.deepPurple.withOpacity(0.14),
                    blurRadius: 6,
                    spreadRadius: 2,
                    offset: const Offset(0, 3)),
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                isShowUserName
                    ? SizedBox(
                        height: 30,
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                    width: 0.4,
                                    color: color ?? Colors.amber.shade900),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                backgroundColor: color?.withOpacity(0.15) ??
                                    Colors.amber.shade900.withOpacity(0.15),
                                foregroundColor:
                                    color ?? Colors.amber.shade900),
                            onPressed: () => {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => UserPage(
                                      userId: post.userId,
                                      userColor:
                                          color ?? Colors.indigo.shade800,
                                    ),
                                  ))
                                },
                            child: Text(
                              "User${post.userId.toString()}",
                            )),
                      )
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
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CommentPage(
                            post: post,
                            color: color ?? Colors.indigo.shade800,
                          ),
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
