import 'package:flutter_nova/features/questions/domain/entities/question_entity.dart';

class QuestionModel extends QuestionEntity {
  const QuestionModel({
    required super.id,
    required super.topicId,
    required super.question,
    required super.answer,
    required super.tags,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json, String topicId) {
    return QuestionModel(
      id: json['id'],
      topicId: topicId,
      question: json['question'],
      answer: json['answer'],
      tags: List<String>.from(json['tags'] ?? []),
    );
  }
}
