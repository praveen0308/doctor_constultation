import 'package:json_annotation/json_annotation.dart';

part 'yt_video_detail_model.g.dart';

@JsonSerializable()
class YtVideoDetailModel {
  String? title;
  String? author_name;
  String? author_url;
  String? type;
  int height;
  int width;
  String? version;
  String? provider_name;
  String? provider_url;
  int thumbnail_height;
  int thumbnail_width;
  String? thumbnail_url;
  String? html;

  YtVideoDetailModel({this.title, this.author_name, this.author_url, this.type, this.height=0, this.width=0, this.version, this.provider_name, this.provider_url, this.thumbnail_height=0, this.thumbnail_width=0, this.thumbnail_url, this.html});

  factory YtVideoDetailModel.fromJson(Map<String, dynamic> json) => _$YtVideoDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$YtVideoDetailModelToJson(this);
}

