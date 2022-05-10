class MessageServiceModel {
  final String id;
  final String from;
  final String to;
  final String content;
  final String createdAt;

  MessageServiceModel({
    required this.id,
    required this.from,
    required this.to,
    required this.content,
    required this.createdAt,
  });
}
