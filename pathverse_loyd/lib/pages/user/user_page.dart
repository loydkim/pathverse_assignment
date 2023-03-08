import 'package:flutter/material.dart';
import 'package:pathverse_loyd/common/theme/app_text_theme.dart';
import 'package:pathverse_loyd/common/widgets/post_item.dart';
import 'package:pathverse_loyd/models/post.dart';
import 'package:pathverse_loyd/provider/users_api_provider.dart';

class UserPage extends StatelessWidget {
  final int userId;
  const UserPage({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: UsersAPIProvider().loadUserPosts(userId),
          builder: (context, snapshot) {
            Widget recentPostListSliver;

            if (snapshot.hasError) {
              recentPostListSliver = const SliverToBoxAdapter(
                child: Center(
                  child: Text('An error has occurred!'),
                ),
              );
            } else if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                recentPostListSliver = const SliverToBoxAdapter(
                    child: Center(child: Text("No Posts")));
              }
              List<Post> posts = snapshot.data!;
              recentPostListSliver = SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                return PostItem(
                  post: posts[index],
                  isShowUserName: false,
                );
              }, childCount: posts.length));
            } else {
              recentPostListSliver = const SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  floating: true,
                  expandedHeight: 60.0,
                  shape: const ContinuousRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40))),
                  backgroundColor: Colors.indigo.shade800,
                  foregroundColor: Colors.white,
                  title: Text("User$userId"),
                  centerTitle: false,
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.info),
                      onPressed: () {},
                    ),
                  ],
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 16,
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
                    ],
                  ),
                ),
                recentPostListSliver
              ],
            );
          }),
    );
  }
}
