import 'dart:convert';

import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pathverse_loyd/models/post.dart';
import 'package:pathverse_loyd/pages/home_landing/widgets/post_item.dart';

enum Pages { dashboard, singout }

class HomeLanding extends StatefulWidget {
  const HomeLanding({super.key});

  @override
  State<HomeLanding> createState() => _HomeLandingState();
}

class _HomeLandingState extends State<HomeLanding> {
  late List<CollapsibleItem> _items;
  late String _headline;
  List<Post> posts = [];
  @override
  void initState() {
    super.initState();
    _items = _generateItems;
    _headline = _items.firstWhere((item) => item.isSelected).text;
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

      // return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
        text: 'Dashboard',
        icon: Icons.assessment,
        onPressed: () => setState(() => _headline = 'DashBoard'),
        isSelected: true,
      ),
      CollapsibleItem(
        text: 'Signout',
        icon: Icons.logout,
        onPressed: () => {print("Signout")},
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
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: posts.map((post) => PostItem(post: post)).toList(),
        ),
      ),
    );
  }
}
