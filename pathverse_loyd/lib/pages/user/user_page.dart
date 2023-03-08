import 'package:flutter/material.dart';
import 'package:pathverse_loyd/common/theme/app_text_theme.dart';
import 'package:pathverse_loyd/common/widgets/custom_app_bar.dart';
import 'package:pathverse_loyd/common/widgets/post_item.dart';
import 'package:pathverse_loyd/provider/users_api_provider.dart';

class UserPage extends StatelessWidget {
  final int userId;
  const UserPage({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.userPageAppBar(userId: userId),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.edit_calendar,
                      size: 28,
                      color: Colors.black54,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text("Recent Posts",
                        style: AppTextTheme.styleW700.copyWith(
                          fontSize: 24,
                          color: Colors.black87,
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              FutureBuilder(
                future: UsersAPIProvider().loadUserPosts(userId),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('An error has occurred!'),
                    );
                  } else if (snapshot.hasData) {
                    if (snapshot.data!.isEmpty) {
                      return const Center(child: Text("No Posts"));
                    }

                    return Column(
                      children: snapshot.data!
                          .map((post) => PostItem(
                                post: post,
                                isShowUserName: false,
                              ))
                          .toList(),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
