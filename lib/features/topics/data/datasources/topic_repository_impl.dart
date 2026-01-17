import 'package:flutter_nova/features/topics/data/datasources/topic_local_datasources.dart';
import 'package:flutter_nova/features/topics/domain/entities/topic_entity.dart';
import 'package:flutter_nova/features/topics/domain/repositories/topic_repository.dart';

class TopicRepositoryImpl extends TopicRepository {
  final TopicLocalDatasources topicLocalDatasources;
  TopicRepositoryImpl(this.topicLocalDatasources);
  @override
  Future<List<TopicEntity>> getTopics() {
    return topicLocalDatasources.getTopics();
  }
}
