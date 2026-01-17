import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nova/features/topics/domain/usecases/get_topic_usecase.dart';
import 'package:flutter_nova/features/topics/presentations/bloc/topic_event.dart';
import 'package:flutter_nova/features/topics/presentations/bloc/topics_state.dart';

class TopicsBloc extends Bloc<TopicsEvent, TopicsState> {
  final GetTopicUsecase getTopicUsecase;

  TopicsBloc({required this.getTopicUsecase}) : super(TopicsInitial()) {
    on<LoadTopics>((event, emit) async {
      emit(TopicsLoading());
      try {
        final topics = await getTopicUsecase();
        emit(TopicsLoaded(topics));
      } catch (e) {
        emit(TopicsError(e.toString()));
      }
    });
  }
}
