class Post {
  final int id;
  final String title, image, content;
      // video;
  // final List<String> categories, tags;

  Post({
    required this.id,
    // required this.categories,
    required this.content,
    required this.image,
    // required this.tags,
    required this.title,
    // required this.video,
  });
  factory Post.fromJson(Map<String,dynamic> json){
    return Post(
        id: json['id'],

        content: json['content']['rendered'],
        image: json['better_featured_image']['source_url'],
        title: json['title']['rendered'],
        // video: video
    );
  }
}
