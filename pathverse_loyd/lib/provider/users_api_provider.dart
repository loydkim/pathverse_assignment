import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:pathverse_loyd/common/utils/constants.dart';
import 'package:pathverse_loyd/models/post.dart';
import 'package:pathverse_loyd/provider/api_provider.dart';

class UsersAPIProvider extends ApiProvider {
  final String _apiUrl = '/users';

  Future<List<Post>> loadUserPosts(int userId) async {
    try {
      final response = await request('$_apiUrl/$userId/posts', HttpVerbs.get);
      return compute(parsePosts, response.body);
    } on Exception {
      throw Exception('Load User Posts fail. Please check internet connection');
    }
  }

  List<Post> parsePosts(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Post>(Post.fromJson).toList();
  }
}
