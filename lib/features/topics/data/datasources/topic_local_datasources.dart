import 'package:flutter_nova/features/topics/data/models/topic_model.dart';

abstract class TopicLocalDatasources {
  Future<List<TopicModel>> getTopics();
}
