import 'package:flutter_nova/features/questions/domain/entities/question_entity.dart';
import 'package:flutter_nova/features/questions/domain/repositories/question_repository.dart';

class GetQuestionsByTopicUseCase {
  final QuestionsRepository repository;

  GetQuestionsByTopicUseCase(this.repository);

  Future<List<QuestionEntity>> call(String topicId) {
    return repository.getQuestionsByTopic(topicId);
  }
}
