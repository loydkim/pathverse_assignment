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
                    Spacer(),
                    PopupMenuButton(
                        // add icon, by default "3 dot" icon
                        // padding: EdgeInsets.zero,
                        child: Container(
                          height: 36,
                          width: 48,
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.more_vert,
                            color: Colors.black54,
                          ),
                        ),
                        // icon: Icon(Icons.more_vert),
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
                                  SizedBox(
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
                                  Icon(
                                    Icons.block,
                                    size: 20,
                                    color: Colors.red,
                                  ),
                                  SizedBox(
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
                  height: 8,
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
