import 'dart:convert';
import 'dart:math';

import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pathverse_loyd/models/post.dart';
import 'package:pathverse_loyd/pages/home_landing/widgets/post_item.dart';
import 'package:pathverse_loyd/pages/home_landing/widgets/sign_out.dart';

enum Pages { dashboard, singout }

class HomeLanding extends StatefulWidget {
  const HomeLanding({super.key});

  @override
  State<HomeLanding> createState() => _HomeLandingState();
}

class _HomeLandingState extends State<HomeLanding> {
  late List<CollapsibleItem> _items;
  late String _headline;
  Pages currentPage = Pages.dashboard;
  List<Post> posts = [];
  int itemCount = 20;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _items = _generateItems;
    _headline = _items.firstWhere((item) => item.isSelected).text;
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.position.pixels) {
        if (itemCount < posts.length) {
          setState(() {
            itemCount = min(itemCount + 20, posts.length);
          });
          print("itemCount is $itemCount");
        }
      }
    });
    loadPost();
  }

  loadPost() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      final List<dynamic> result = jsonDecode(response.body);

      for (var element in result) {
        posts.add(Post.fromJson(element));
      }
      setState(() {});
      print("finish fetch");
    } else {
      throw Exception('Failed to load album');
    }
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

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Container(
          color: Colors.white,
          child: CollapsibleSidebar(
            isCollapsed: MediaQuery.of(context).size.width <= 800,
            items: _items,
            height: 255,
            collapseOnBodyTap: true,
            avatarImg: const AssetImage('assets/images/logo.png'),
            title: 'Pathverse',
            iconSize: 30,
            minWidth: 72,
            maxWidth: 260,
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
        return Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          child: ListView.builder(
            itemCount: itemCount,
            controller: _scrollController,
            itemBuilder: (context, index) {
              if (posts.length >= itemCount) {
                return PostItem(post: posts[index]);
              } else {
                return const Text("Loading");
              }
              // return posts.map((post) => PostItem(post: post)).toList();
            },
          ),
        );

      case Pages.singout:
        return const SignOut();

      default:
        return const Center(child: Text("Error"));
    }
  }
}
