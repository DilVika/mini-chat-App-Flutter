
class MessageDataModel {
  final int id;
  final String from;
  final String to;
  final String text;

  final DateTime createAt;

  MessageDataModel({required this.id, required this.from, required this.to, required this.text, required this.createAt});

}
