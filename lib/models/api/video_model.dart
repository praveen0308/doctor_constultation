import 'package:json_annotation/json_annotation.dart';

part 'video_model.g.dart';

@JsonSerializable()
class VideoModel {
  int VideoID;
  int DoctorID;
  String Title;
  String Description;
  String VideoPath;
  String Thumbnail;
  String VideoUrl;
  bool IsPaid;
  int SubscriptionID;
  int AddedBy;
  String AddedOn;
  int UpdatedBy;
  String UpdatedOn;
  bool IsActive;

  VideoModel(
      {this.VideoID=0,
      this.DoctorID=0,
      this.Title="",
      this.Description="",
      this.VideoPath="",
      this.Thumbnail="",
      this.VideoUrl="",
      this.IsPaid=false,
      this.SubscriptionID=0,
      this.AddedBy=0,
      this.AddedOn="",
      this.UpdatedBy=0,
      this.UpdatedOn="",
      this.IsActive=true});

  factory VideoModel.fromJson(Map<String, dynamic> json) =>
      _$VideoModelFromJson(json);

  Map<String, dynamic> toJson() => _$VideoModelToJson(this);
}
