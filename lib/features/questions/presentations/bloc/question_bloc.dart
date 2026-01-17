import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nova/features/questions/domain/usecases/get_question_by_topic.dart';
import 'package:flutter_nova/features/questions/presentations/bloc/question_event.dart';
import 'package:flutter_nova/features/questions/presentations/bloc/question_state.dart';

class QuestionsBloc extends Bloc<QuestionsEvent, QuestionsState> {
  final GetQuestionsByTopicUseCase getQuestionsByTopicUseCase;

  QuestionsBloc({required this.getQuestionsByTopicUseCase})
    : super(QuestionsInitial()) {
    on<LoadQuestionsByTopic>(_onLoadQuestionsByTopic);
    on<SearchQuestions>(_onSearchQuestion);
    on<ClearSearch>(_clearSearch);
    ;
  }

  Future<void> _onLoadQuestionsByTopic(
    LoadQuestionsByTopic event,
    Emitter<QuestionsState> emit,
  ) async {
    emit(QuestionsLoading());
    final questions = await getQuestionsByTopicUseCase(event.topicId);
    emit(QuestionsLoaded(questions: questions));
  }

  Future<void> _onSearchQuestion(
    SearchQuestions event,
    Emitter<QuestionsState> emit,
  ) async {
    final allQuestions = await getQuestionsByTopicUseCase(event.topicId);

    final filtered = allQuestions.where((q) {
      final query = event.query.toLowerCase();
      return q.question.toLowerCase().contains(query) ||
          q.tags.any((t) => t.toLowerCase().contains(query));
    }).toList();

    emit(QuestionsLoaded(questions: filtered, searchQuery: event.query));
  }

  Future<void> _clearSearch(
    ClearSearch event,
    Emitter<QuestionsState> emit,
  ) async {
    final questions = await getQuestionsByTopicUseCase(event.topicId);

    emit(QuestionsLoaded(questions: questions));
  }
}
