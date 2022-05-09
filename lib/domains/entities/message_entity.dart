class MessageEntity {
  final int id;
  final String from;
  final String to;
  final String? text;
  final DateTime? createdAt;

  MessageEntity(this.id, this.text, this.createdAt, this.from, this.to);
}
