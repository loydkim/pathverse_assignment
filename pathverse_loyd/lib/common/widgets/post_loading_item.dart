import 'package:flutter/material.dart';
import 'package:pathverse_loyd/common/widgets/loading_square.dart';

class PostLoadingItem extends StatelessWidget {
  final bool isShowUserName;
  const PostLoadingItem({super.key, this.isShowUserName = true});

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
                    offset: const Offset(0, 3)),
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                isShowUserName ? const LoadingSquare(width: 70) : Container(),
                const SizedBox(
                  height: 8,
                ),
                const LoadingSquare(height: 22),
                const SizedBox(
                  height: 8,
                ),
                const LoadingSquare(height: 22),
                const SizedBox(
                  height: 8,
                ),
                const LoadingSquare(height: 22),
                const SizedBox(
                  height: 8,
                ),
                const LoadingSquare(height: 22),
                const SizedBox(
                  height: 8,
                ),
                const LoadingSquare(height: 22),
                const SizedBox(
                  height: 16,
                ),
                const LoadingSquare(width: 130, height: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
