import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_nova/features/questions/data/datasources/question_local_datasources.dart';
import 'package:flutter_nova/features/questions/data/model/Question_model.dart';

class QuestionsLocalDataSourceImpl implements QuestionsLocalDataSource {
  @override
  Future<List<QuestionModel>> getQuestionsByTopic(String topicId) async {
    final jsonString = await rootBundle.loadString(
      'assets/interview/flutter_question.json',
    );

    final Map<String, dynamic> decoded = json.decode(jsonString);

    final List topics = decoded['topics'];

    final topic = topics.firstWhere((t) => t['id'] == topicId);

    final List questionsJson = topic['questions'];

    return questionsJson
        .map<QuestionModel>((q) => QuestionModel.fromJson(q, topicId))
        .toList();
  }
}
