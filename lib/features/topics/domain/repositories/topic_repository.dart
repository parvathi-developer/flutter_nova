import 'package:flutter_nova/features/topics/domain/entities/topic_entity.dart';

abstract class TopicRepository {
  Future<List<TopicEntity>> getTopics();
}
