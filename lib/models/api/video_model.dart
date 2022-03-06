import 'package:json_annotation/json_annotation.dart';

part 'video_model.g.dart';

@JsonSerializable()
class VideoModel {
  int? VideoID;
  int? DoctorID;
  String? Title;
  String? Description;
  String? VideoPath;
  String? Thumbnail;
  String? VideoUrl;
  bool IsPaid;
  int? SubscriptionID;
  int? AddedBy;
  int? AddedOn;
  int? UpdatedBy;
  int? UpdatedOn;
  bool? IsActive;

  VideoModel(
      {this.VideoID,
      this.DoctorID,
      this.Title,
      this.Description,
      this.VideoPath,
      this.Thumbnail,
      this.VideoUrl,
      this.IsPaid=false,
      this.SubscriptionID,
      this.AddedBy,
      this.AddedOn,
      this.UpdatedBy,
      this.UpdatedOn,
      this.IsActive});

  factory VideoModel.fromJson(Map<String, dynamic> json) =>
      _$VideoModelFromJson(json);

  Map<String, dynamic> toJson() => _$VideoModelToJson(this);
}
