import 'package:json_annotation/json_annotation.dart';

part 'notification_model.g.dart';

@JsonSerializable()
class NotificationModel {
  int? NotificationID;
  int? ReceiverID;
  int? SenderID;
  String? Title;
  String? Description;
  String? ImageUrl;
  bool? IsSeen;
  int? ContentID;
  int? ContentTypeID;
  bool? IsActive;

  NotificationModel({this.NotificationID, this.ReceiverID, this.SenderID, this.Title, this.Description, this.ImageUrl, this.IsSeen, this.ContentID, this.ContentTypeID, this.IsActive});

  factory NotificationModel.fromJson(Map<String, dynamic> json) => _$NotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}

