import 'package:flutter_nova/features/questions/domain/entities/question_entity.dart';

abstract class QuestionsRepository {
  Future<List<QuestionEntity>> getQuestionsByTopic(String topicId);
}
