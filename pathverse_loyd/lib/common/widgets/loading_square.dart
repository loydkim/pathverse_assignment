import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoadingSquare extends StatelessWidget {
  final double? width;
  final double? height;
  const LoadingSquare({super.key, this.width, this.height = 26});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: const BorderRadius.all(Radius.circular(8))),
    );
  }
}
