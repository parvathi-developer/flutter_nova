class QuestionEntity {
  final String id;
  final String topicId;
  final String question;
  final String answer;
  final List<String> tags;

  const QuestionEntity({
    required this.id,
    required this.topicId,
    required this.question,
    required this.answer,
    required this.tags,
  });
}
