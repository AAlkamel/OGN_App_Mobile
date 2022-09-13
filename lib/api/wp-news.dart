import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/post.dart';
Future<List<Post>?> getPost(String url)async{
  http.Response posts =
  await http.get(Uri.parse(url));
  if(posts.statusCode==200){
    print(posts.headers);
    //for list
    final parsed =json.decode(posts.body).cast<Map<String,dynamic>>();

    return parsed.map<Post>((item)=>Post.fromJson(item)).toList();
    // for single post
    // return Post.fromJson(json.decode(posts.body));
  }else{
    throw Exception('error');
  }
}
