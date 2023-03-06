import 'package:flutter/material.dart';
import 'package:pathverse_loyd/models/comment.dart';

class CommentItem extends StatelessWidget {
  final Comment comment;
  const CommentItem({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comment.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  comment.email,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(comment.body)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
