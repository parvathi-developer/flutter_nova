import '../../domain/entities/question_entity.dart';

abstract class QuestionsState {}

class QuestionsInitial extends QuestionsState {}

class QuestionsLoading extends QuestionsState {}

class QuestionsLoaded extends QuestionsState {
  final List<QuestionEntity> questions;
  final String searchQuery;

  QuestionsLoaded({required this.questions, this.searchQuery = ''});
}

class QuestionsError extends QuestionsState {
  final String message;

  QuestionsError(this.message);
}
