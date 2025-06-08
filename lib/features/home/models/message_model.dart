
class MessageModel {
  final String message;
  final String id;
  final String timestamp;
  MessageModel(this.message, this.id, this.timestamp);

  factory MessageModel.fromJson(json) {
    return MessageModel(json['kMessage'], json['Id'],json['kCreatedAt']);
  }
}