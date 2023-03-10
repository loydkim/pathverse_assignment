import 'package:flutter/material.dart';
import 'package:pathverse_loyd/common/theme/app_text_theme.dart';
import 'package:pathverse_loyd/common/widgets/expandable_text.dart';
import 'package:pathverse_loyd/models/comment.dart';

class CommentItem extends StatelessWidget {
  final Comment comment;
  final Color color;
  const CommentItem({super.key, required this.comment, required this.color});

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
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.mail,
                      size: 18,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      comment.email,
                    ),
                    const Spacer(),
                    PopupMenuButton(
                        child: Container(
                          height: 36,
                          width: 48,
                          alignment: Alignment.centerRight,
                          child: const Icon(
                            Icons.more_vert,
                            color: Colors.black54,
                          ),
                        ),
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem<int>(
                              value: 0,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.report,
                                    size: 20,
                                    color: Colors.indigo.shade900,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Report",
                                    style: AppTextTheme.styleW400,
                                  ),
                                ],
                              ),
                            ),
                            PopupMenuItem<int>(
                              value: 1,
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.block,
                                    size: 20,
                                    color: Colors.red,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Block",
                                    style: AppTextTheme.styleW400,
                                  ),
                                ],
                              ),
                            ),
                          ];
                        },
                        onSelected: (value) {}),
                  ],
                ),
                const SizedBox(
                  height: 2,
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
