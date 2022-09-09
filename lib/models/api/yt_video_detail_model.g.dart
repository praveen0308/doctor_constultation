// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yt_video_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YtVideoDetailModel _$YtVideoDetailModelFromJson(Map<String, dynamic> json) =>
    YtVideoDetailModel(
      title: json['title'] as String?,
      author_name: json['author_name'] as String?,
      author_url: json['author_url'] as String?,
      type: json['type'] as String?,
      height: json['height'] as int? ?? 0,
      width: json['width'] as int? ?? 0,
      version: json['version'] as String?,
      provider_name: json['provider_name'] as String?,
      provider_url: json['provider_url'] as String?,
      thumbnail_height: json['thumbnail_height'] as int? ?? 0,
      thumbnail_width: json['thumbnail_width'] as int? ?? 0,
      thumbnail_url: json['thumbnail_url'] as String?,
      html: json['html'] as String?,
    );

Map<String, dynamic> _$YtVideoDetailModelToJson(YtVideoDetailModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('title', instance.title);
  writeNotNull('author_name', instance.author_name);
  writeNotNull('author_url', instance.author_url);
  writeNotNull('type', instance.type);
  val['height'] = instance.height;
  val['width'] = instance.width;
  writeNotNull('version', instance.version);
  writeNotNull('provider_name', instance.provider_name);
  writeNotNull('provider_url', instance.provider_url);
  val['thumbnail_height'] = instance.thumbnail_height;
  val['thumbnail_width'] = instance.thumbnail_width;
  writeNotNull('thumbnail_url', instance.thumbnail_url);
  writeNotNull('html', instance.html);
  return val;
}
