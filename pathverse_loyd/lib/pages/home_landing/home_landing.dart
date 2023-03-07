import 'dart:math';

import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:pathverse_loyd/common/utils/constants.dart';
import 'package:pathverse_loyd/models/post.dart';
import 'package:pathverse_loyd/common/widgets/post_item.dart';
import 'package:pathverse_loyd/pages/home_landing/widgets/sign_out.dart';
import 'package:pathverse_loyd/provider/posts_api_provider.dart';

class HomeLanding extends StatefulWidget {
  const HomeLanding({super.key});

  @override
  State<HomeLanding> createState() => _HomeLandingState();
}

class _HomeLandingState extends State<HomeLanding> {
  late List<CollapsibleItem> _items;
  Pages currentPage = Pages.dashboard;
  List<Post> posts = [];
  int itemCount = 20;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _items = _generateItems;
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.position.pixels) {
        if (itemCount < posts.length) {
          setState(() {
            itemCount = min(itemCount + 20, posts.length);
          });
        }
      }
    });
    loadPost();
  }

  loadPost() async {
    final postsAPIProvider = PostsAPIProvider();
    posts = await postsAPIProvider.fetchPosts();
    setState(() {});
  }

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
        text: 'Dashboard',
        icon: Icons.assessment,
        onPressed: () => setState(() => currentPage = Pages.dashboard),
        isSelected: true,
      ),
      CollapsibleItem(
        text: 'Signout',
        icon: Icons.logout,
        onPressed: () => setState(() => currentPage = Pages.singout),
      ),
    ];
  }

  bool _isHideSidebar = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Pathverse"),
        leading: IconButton(
          icon: Icon(_isHideSidebar ? Icons.menu : Icons.segment),
          onPressed: () {
            setState(() {
              _isHideSidebar = !_isHideSidebar;
            });
          },
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
          color: Colors.white,
          child: CollapsibleSidebar(
            isCollapsed: _isHideSidebar
                ? true
                : MediaQuery.of(context).size.width <= 800,
            items: _items,
            height: _isHideSidebar ? 0 : 255,
            collapseOnBodyTap: _isHideSidebar ? false : true,
            avatarImg: const AssetImage('assets/images/logo.png'),
            title: 'Pathverse',
            iconSize: 30,
            minWidth: _isHideSidebar ? 0 : 72,
            maxWidth: _isHideSidebar ? 0 : 260,
            screenPadding: 8,
            topPadding: 10,
            body: _body(size, context),
            backgroundColor: Colors.black,
            selectedTextColor: Colors.limeAccent,
            textStyle: TextStyle(fontSize: 15),
            titleStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            toggleTitleStyle:
                TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            sidebarBoxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10,
                spreadRadius: 0.01,
                offset: Offset(0.1, 0.1),
              ),
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10,
                spreadRadius: 0.01,
                offset: Offset(0.1, 0.1),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _body(Size size, BuildContext context) {
    switch (currentPage) {
      case Pages.dashboard:
        return AnimatedSize(
          duration: const Duration(milliseconds: 45),
          curve: Curves.easeOut,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white,
            child: posts.length >= itemCount
                ? ListView.builder(
                    itemCount: itemCount,
                    controller: _scrollController,
                    itemBuilder: (context, index) {
                      return PostItem(post: posts[index]);
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
}
