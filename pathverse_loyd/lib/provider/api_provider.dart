import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:pathverse_loyd/common/config/config.dart';
import 'package:pathverse_loyd/common/utils/constants.dart';

class ApiProvider {
  Future<http.Response> request(String endpoint, HttpVerbs verb,
      {dynamic body}) async {
    // if (!await Functions.isConnecteInternet()) {
    //   throw Exception("common.errors.require_internet");
    // }

    http.Response result;
    Uri apiUrl = Config.apiUrl;
    Uri uri = apiUrl.resolve(endpoint);

    switch (verb) {
      case HttpVerbs.post:
        var payload = body;
        if (body != null) payload = json.encode(body);
        result = await http.post(
          uri,
          body: payload,
        );
        break;
      case HttpVerbs.get:
        result = await http.get(
          uri,
        );
        break;
      case HttpVerbs.put:
        var payload = body;
        if (body != null) payload = json.encode(body);
        result = await http.put(
          uri,
          body: payload,
        );
        break;
      case HttpVerbs.delete:
        result = await http.delete(
          uri,
        );
        break;
      default:
        throw Exception("Method not implemented");
    }

    // Check valid responses
    if (result.statusCode >= HttpStatus.ok &&
        result.statusCode <= HttpStatus.imUsed) {
      return result;
    } else {
      throw Exception(result.body);
    }
  }
}
