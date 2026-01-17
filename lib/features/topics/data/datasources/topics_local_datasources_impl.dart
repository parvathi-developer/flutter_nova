import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_nova/features/topics/data/datasources/topic_local_datasources.dart';
import 'package:flutter_nova/features/topics/data/models/topic_model.dart';

class TopicsLocalDatasourcesImpl extends TopicLocalDatasources {
  @override
  Future<List<TopicModel>> getTopics() async {
    final jsonStr = await rootBundle.loadString(
      'assets/interview/flutter_question.json',
    );

    final data = json.decode(jsonStr);

    return (data['topics'] as List).map((e) => TopicModel.fromJson(e)).toList();
  }
}
