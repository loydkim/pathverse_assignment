import 'dart:convert';

import 'package:pathverse_loyd/common/utils/constants.dart';
import 'package:pathverse_loyd/models/comment.dart';
import 'package:pathverse_loyd/models/post.dart';
import 'package:pathverse_loyd/provider/api_provider.dart';

class PostsAPIProvider extends ApiProvider {
  final String _apiUrl = '/posts';

  Future<List<Post>> fetchPosts() async {
    try {
      final response = await request(_apiUrl, HttpVerbs.get);

      List<Post> posts = [];
      final List<dynamic> result = jsonDecode(response.body);
      for (var element in result) {
        posts.add(Post.fromJson(element));
      }
      return posts;
    } on Exception {
      throw Exception('Fetch Posts Fail. Please check internet connection');
    }
  }

  Future<List<Comment>> loadComments(int postId) async {
    try {
      final response =
          await request('$_apiUrl/$postId/comments', HttpVerbs.get);

      List<Comment> comments = [];
      final List<dynamic> result = jsonDecode(response.body);
      for (var element in result) {
        comments.add(Comment.fromJson(element));
      }
      return comments;
    } on Exception {
      throw Exception('Load Comments Fail. Please check internet connection');
    }
  }
}
