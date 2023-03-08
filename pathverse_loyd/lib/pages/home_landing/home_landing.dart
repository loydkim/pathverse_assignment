import 'dart:math';

import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:pathverse_loyd/common/utils/constants.dart';
import 'package:pathverse_loyd/common/widgets/custom_app_bar.dart';
import 'package:pathverse_loyd/common/widgets/post_loading_item.dart';
import 'package:pathverse_loyd/models/post.dart';
import 'package:pathverse_loyd/common/widgets/post_item.dart';
import 'package:pathverse_loyd/models/user.dart';
import 'package:pathverse_loyd/pages/home_landing/widgets/collapsible_side_bar.dart';
import 'package:pathverse_loyd/pages/home_landing/widgets/sign_out.dart';
import 'package:pathverse_loyd/provider/posts_api_provider.dart';
import 'dart:math' as math;

class HomeLanding extends StatefulWidget {
  const HomeLanding({super.key});

  @override
  State<HomeLanding> createState() => _HomeLandingState();
}

class _HomeLandingState extends State<HomeLanding> {
  final ScrollController _scrollController = ScrollController();
  late List<CollapsibleItem> _items;
  Pages _currentPage = Pages.dashboard;
  List<Post> _posts = [];
  final Map<int, User> _users = {};
  int _itemCount = 20;
  bool _isShowSearchBar = false;
  bool _isHideSidebar = false;

  @override
  void initState() {
    super.initState();
    _items = _generateItems;
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent >
          _scrollController.position.pixels - 100) {
        if (_itemCount < _posts.length) {
          setState(() {
            _itemCount = min(_itemCount + 20, _posts.length);
          });
        }
      }
    });
  }

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
        text: 'Dashboard',
        icon: Icons.assessment,
        onPressed: () => setState(() => _currentPage = Pages.dashboard),
        isSelected: true,
      ),
      CollapsibleItem(
        text: 'Signout',
        icon: Icons.logout,
        onPressed: () => setState(() => _currentPage = Pages.singout),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.homeLandingAppBar(
        isShowSearchBar: _isShowSearchBar,
        updateSearchBar: (showSearchBar) {
          setState(() {
            _isShowSearchBar = showSearchBar;
          });
        },
        isHideSidebar: _isHideSidebar,
        updateHideSidebar: (showHideSidebar) {
          setState(() {
            _isHideSidebar = showHideSidebar;
          });
        },
      ),
      body: SafeArea(
        child: FutureBuilder<List<Post>>(
          future: PostsAPIProvider().fetchPosts(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('An error has occurred!'),
              );
            } else if (snapshot.hasData) {
              _posts = snapshot.data ?? [];
              if (_posts.isEmpty) {
                return const Center(child: Text("No Posts"));
              }

              for (var post in _posts) {
                if (!_users.containsKey(post.userId)) {
                  _users[post.userId] = User(
                      id: post.userId,
                      color:
                          Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                              .withOpacity(1.0));
                }
              }

              return PathverseCollapsibleSideBar(
                  isHideSidebar: _isHideSidebar, items: _items, body: _body());
            } else {
              return PathverseCollapsibleSideBar(
                  isHideSidebar: _isHideSidebar,
                  items: _items,
                  body: _loading());
            }
          },
        ),
      ),
    );
  }

  Widget _body() {
    switch (_currentPage) {
      case Pages.dashboard:
        return AnimatedSize(
          duration: const Duration(milliseconds: 45),
          curve: Curves.easeOut,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white,
            child: _posts.length >= _itemCount
                ? ListView.builder(
                    itemCount: _itemCount,
                    controller: _scrollController,
                    itemBuilder: (context, index) {
                      final post = _posts[index];
                      return PostItem(
                        post: post,
                        color: _users[post.userId]?.color,
                      );
                    },
                  )
                : const Center(child: CircularProgressIndicator()),
          ),
        );

      case Pages.singout:
        return const SignOut();

      default:
        return const Center(child: Text("Error"));
    }
  }

  Widget _loading() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const PostLoadingItem();
        },
      ),
    );
  }
}
