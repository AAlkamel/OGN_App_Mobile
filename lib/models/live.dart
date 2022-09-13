class Live {
  final String title, content;
  Live({
    required this.content,
    required this.title,
  });
  factory Live.fromJson(Map<String,dynamic> json){
    return Live(
      content: json['content']['rendered'],
      title: json['title']['rendered'],
      // video: video
    );
  }
}
