import 'package:flutter_nova/features/topics/domain/entities/topic_entity.dart';

abstract class TopicsState {}

class TopicsInitial extends TopicsState {}

class TopicsLoading extends TopicsState {}

class TopicsLoaded extends TopicsState {
  final List<TopicEntity> topics;
  TopicsLoaded(this.topics);
}

class TopicsError extends TopicsState {
  final String message;
  TopicsError(this.message);
}
