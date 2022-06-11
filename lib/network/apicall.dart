import 'dart:convert';
import 'package:http/http.dart';
import 'package:machine_test/model/httpresponse.dart';
import 'package:machine_test/model/post.dart';

class APICall{
  static Future<HTTPResponse<List<Post>>> getPosts(
      {int page = 1, int limit = 10}) async {
    try {
      var response = await get(Uri.parse('https://fakestoreapi.com/products?_limit=$limit&_page=$page'),
      );
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        List<Post> posts = [];
        body.forEach((e) {
          Post post = Post.fromJson(e);
          posts.add(post);
        });
        return HTTPResponse<List<Post>>(
          true,
          posts,
          message: 'Request Successful',
          statusCode: response.statusCode,
        );
      } else {
        return HTTPResponse<List<Post>>(
          false,
          null,
          message:
          'Invalid data received from the server! Please try again in a moment.',
          statusCode: response.statusCode,
        );
      }
    }catch (e) {
      print('UNEXPECTED ERROR');
      print(e.toString());
      return HTTPResponse<List<Post>>(
        false,
        null,
        message: 'Something went wrong! Please try again in a moment!',
      );
    }
  }
}