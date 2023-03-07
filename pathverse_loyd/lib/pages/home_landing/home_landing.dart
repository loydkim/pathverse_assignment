import 'dart:math';

import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:pathverse_loyd/common/theme/app_text_theme.dart';
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
      if (_scrollController.position.maxScrollExtent >
          _scrollController.position.pixels - 100) {
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
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/login_bg.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16))),
        ),
        shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40))),
        title: SizedBox(
          child: Row(
            children: [
              SizedBox(
                  width: 28,
                  height: 28,
                  child: Image.asset("assets/images/logo.png")),
              const SizedBox(
                width: 6,
              ),
              Text("PATHVERSE",
                  style: AppTextTheme.styleW700.copyWith(
                      fontSize: 20, color: Colors.white, letterSpacing: 2.6)),
            ],
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 1.1,
        toolbarHeight: 66,
        leading: IconButton(
          icon: Icon(_isHideSidebar ? Icons.menu : Icons.segment),
          onPressed: () {
            setState(() {
              _isHideSidebar = !_isHideSidebar;
            });
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 4.0),
            child: CollapsibleSidebar(
              isCollapsed: _isHideSidebar
                  ? true
                  : MediaQuery.of(context).size.width <= 800,
              items: _items,
              height: _isHideSidebar ? 0 : 205,
              collapseOnBodyTap: _isHideSidebar ? false : true,
              iconSize: 30,
              minWidth: _isHideSidebar ? 0 : 72,
              maxWidth: _isHideSidebar ? 0 : 260,
              showTitle: false,
              screenPadding: 8,
              topPadding: 10,
              body: _body(size, context),
              backgroundColor: Colors.black,
              selectedTextColor: Colors.limeAccent,
              textStyle: const TextStyle(fontSize: 15),
              titleStyle:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              toggleTitleStyle:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              sidebarBoxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  blurRadius: 4,
                  spreadRadius: 0.01,
                  offset: const Offset(0.1, 0.1),
                ),
                BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  blurRadius: 4,
                  spreadRadius: 0.01,
                  offset: const Offset(0.1, 0.1),
                ),
              ],
            ),
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
