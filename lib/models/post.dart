class Post {
  final int id;
  final String title, image, content, video;
  final List<String> categories, tags;

  Post({
    required this.id,
    required this.categories,
    required this.content,
    required this.image,
    required this.tags,
    required this.title,
    required this.video,
  });
}
