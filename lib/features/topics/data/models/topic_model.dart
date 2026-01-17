import 'package:flutter_nova/features/topics/domain/entities/topic_entity.dart';

class TopicModel extends TopicEntity {
  TopicModel({
    required super.id,
    required super.title,
    required super.description,
  });

  factory TopicModel.fromJson(Map<String, dynamic> json) {
    return TopicModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
    );
  }
}
