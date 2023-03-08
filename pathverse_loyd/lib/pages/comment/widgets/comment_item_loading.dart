import 'package:flutter/material.dart';
import 'package:pathverse_loyd/common/widgets/loading_square.dart';

class CommentItemLoading extends StatelessWidget {
  final Color color;
  const CommentItemLoading({super.key, required this.color});

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
                    color: color.withOpacity(0.1),
                    blurRadius: 3,
                    spreadRadius: 2,
                    offset: const Offset(0, 1)),
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
