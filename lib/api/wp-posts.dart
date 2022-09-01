import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List> fetchPosts() async {
  List posts = [];
  try {
    final http.Response response = await http.get(Uri.parse('https://ognreports.news/wp-json/wp/v2/posts'));
     posts = json.decode(response.body);
    // final response = await http.get(Uri.parse('https://ognreports.news/wp-json/wp/v2/posts'),headers: {'Accept':'application/json'});
    // var dataJson = jsonDecode(response.body);

    print(posts);


  } catch(e) {
    print(e);
    throw 'Name is empty.';
  }
    return posts;

}