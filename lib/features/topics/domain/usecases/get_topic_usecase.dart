import 'package:flutter_nova/features/topics/domain/entities/topic_entity.dart';
import 'package:flutter_nova/features/topics/domain/repositories/topic_repository.dart';

class GetTopicUsecase {
  final TopicRepository topicRepository;
  GetTopicUsecase(this.topicRepository);

  Future<List<TopicEntity>> call() {
    return topicRepository.getTopics();
  }
}
