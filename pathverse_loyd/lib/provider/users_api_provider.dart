import 'dart:convert';

import 'package:pathverse_loyd/common/utils/constants.dart';
import 'package:pathverse_loyd/models/post.dart';
import 'package:pathverse_loyd/provider/api_provider.dart';

class UsersAPIProvider extends ApiProvider {
  final String _apiUrl = '/users';

  Future<List<Post>> loadUserPosts(int userId) async {
    try {
      final response = await request('$_apiUrl/$userId/posts', HttpVerbs.get);

      List<Post> recentPosts = [];
      final List<dynamic> result = jsonDecode(response.body);
      for (var element in result) {
        recentPosts.add(Post.fromJson(element));
      }
      return recentPosts;
    } on Exception {
      throw Exception('Load User Posts fail. Please check internet connection');
    }
  }
}
