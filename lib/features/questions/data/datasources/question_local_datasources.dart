import 'package:flutter_nova/features/questions/data/model/Question_model.dart';

abstract class QuestionsLocalDataSource {
  Future<List<QuestionModel>> getQuestionsByTopic(String topicId);
}
