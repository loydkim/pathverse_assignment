import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:pathverse_loyd/common/utils/constants.dart';
import 'package:pathverse_loyd/models/comment.dart';
import 'package:pathverse_loyd/models/post.dart';
import 'package:pathverse_loyd/provider/api_provider.dart';

class PostsAPIProvider extends ApiProvider {
  final String _apiUrl = '/posts';

  Future<List<Post>> fetchPosts() async {
    try {
      final response = await request(_apiUrl, HttpVerbs.get);
      return compute(parsePosts, response.body);
    } on Exception {
      throw Exception('Fetch Posts Fail. Please check internet connection');
    }
  }

  List<Post> parsePosts(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Post>((json) => Post.fromJson(json)).toList();
  }

  Future<List<Comment>> loadComments(int postId) async {
    try {
      final response =
          await request('$_apiUrl/$postId/comments', HttpVerbs.get);
      return compute(parseComments, response.body);
    } on Exception {
      throw Exception('Load Comments Fail. Please check internet connection');
    }
  }

  List<Comment> parseComments(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Comment>((json) => Comment.fromJson(json)).toList();
  }
}
