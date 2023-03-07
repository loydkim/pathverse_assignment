import 'package:flutter/material.dart';
import 'package:pathverse_loyd/common/theme/app_text_theme.dart';
import 'package:pathverse_loyd/common/widgets/expandable_text.dart';
import 'package:pathverse_loyd/models/comment.dart';

class CommentItem extends StatelessWidget {
  final Comment comment;
  const CommentItem({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              boxShadow: [
                BoxShadow(
                    color: Colors.deepPurple.withOpacity(0.14),
                    blurRadius: 7,
                    spreadRadius: 5,
                    offset: const Offset(0, 3)),
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.mail,
                      size: 18,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      comment.email,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                Text(
                  comment.name,
                  style: AppTextTheme.styleW700.copyWith(fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                ExpandableText(
                  comment.body,
                  trimLines: 6,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
