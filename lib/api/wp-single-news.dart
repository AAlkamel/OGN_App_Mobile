import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/post.dart';
Future<Post?> getSingleNews(id)async{
  http.Response post =
  await http.get(Uri.parse('https://ognreports.news/wp-json/wp/v2/news/$id'));
  if(post.statusCode==200){
    // print(posts.body);
    //for list
    // final parsed =json.decode(posts.body).cast<Map<String,dynamic>>();
    // return parsed.map<Post>((item)=>Post.fromJson(item)).toList();
    // for single post
    return Post.fromJson(json.decode(post.body));
  }else{
    throw Exception('error');
  }
}
