import 'package:flutter_nova/features/questions/data/datasources/question_local_datasources.dart';
import 'package:flutter_nova/features/questions/domain/entities/question_entity.dart';
import 'package:flutter_nova/features/questions/domain/repositories/question_repository.dart';

class QuestionsRepositoryImpl implements QuestionsRepository {
  final QuestionsLocalDataSource localDataSource;

  QuestionsRepositoryImpl(this.localDataSource);

  @override
  Future<List<QuestionEntity>> getQuestionsByTopic(String topicId) {
    return localDataSource.getQuestionsByTopic(topicId);
  }
}
