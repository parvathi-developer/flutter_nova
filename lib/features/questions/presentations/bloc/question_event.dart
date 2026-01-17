abstract class QuestionsEvent {}

class LoadQuestionsByTopic extends QuestionsEvent {
  final String topicId;

  LoadQuestionsByTopic(this.topicId);
}

class SearchQuestions extends QuestionsEvent {
  final String query;
  final String topicId;

  SearchQuestions({required this.query, required this.topicId});
}

class ClearSearch extends QuestionsEvent {
  final String topicId;

  ClearSearch(this.topicId);
}
