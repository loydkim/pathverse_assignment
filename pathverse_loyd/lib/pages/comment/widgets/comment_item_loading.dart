import 'package:flutter/material.dart';
import 'package:pathverse_loyd/common/widgets/loading_square.dart';

class CommentItemLoading extends StatelessWidget {
  const CommentItemLoading({super.key});

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
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(
                  height: 6,
                ),
                LoadingSquare(width: 180, height: 20),
                SizedBox(
                  height: 14,
                ),
                LoadingSquare(height: 20),
                SizedBox(
                  height: 14,
                ),
                LoadingSquare(height: 20),
                SizedBox(
                  height: 8,
                ),
                LoadingSquare(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
