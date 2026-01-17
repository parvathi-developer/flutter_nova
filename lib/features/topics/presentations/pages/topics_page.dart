import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nova/core/di/service_locator.dart';
import 'package:flutter_nova/core/widgets/fade_slide.dart';
import 'package:flutter_nova/features/questions/presentations/bloc/question_bloc.dart';
import 'package:flutter_nova/features/questions/presentations/bloc/question_event.dart';
import 'package:flutter_nova/features/questions/presentations/pages/question_page.dart';
import 'package:flutter_nova/features/topics/presentations/bloc/topic_event.dart';
import 'package:flutter_nova/features/topics/presentations/bloc/topics_bloc.dart';
import 'package:flutter_nova/features/topics/presentations/bloc/topics_state.dart';
import 'package:flutter_nova/features/topics/presentations/widgets/topic_card.dart';

class TopicsPage extends StatelessWidget {
  static const _gradients = [
    [Color(0xFF6C63FF), Color(0xFF4A47A3)],
    [Color(0xFF00BFA6), Color(0xFF00796B)],
    [Color(0xFFFF8A65), Color(0xFFD84315)],
    [Color(0xFF42A5F5), Color(0xFF1565C0)],
    [Color(0xFFAB47BC), Color(0xFF6A1B9A)],
  ];

  static const _icons = [
    Icons.flutter_dash,
    Icons.widgets,
    Icons.sync_alt,
    Icons.navigation,
    Icons.architecture,
  ];
  const TopicsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: BlocProvider<TopicsBloc>(
        create: (_) => context.read<TopicsBloc>()..add(LoadTopics()),
        child: BlocBuilder<TopicsBloc, TopicsState>(
          builder: (context, state) {
            if (state is TopicsLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is TopicsLoaded) {
              return ListView.separated(
                padding: const EdgeInsets.all(16),
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: state.topics.length,
                separatorBuilder: (_, _) => SizedBox(height: 14),
                itemBuilder: (context, index) {
                  final topic = state.topics[index];
                  return FadeSlide(
                    child: TopicCard(
                      topic: topic,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => BlocProvider(
                              create: (_) =>
                                  s1<QuestionsBloc>()
                                    ..add(LoadQuestionsByTopic(topic.id)),
                              child: QuestionsPage(
                                topicId: topic.id,
                                topicTitle: topic.title,
                              ),
                            ),
                          ),
                        );
                      },
                      gradientColors: _gradients[index % _gradients.length],
                      icon: _icons[index % _icons.length],
                    ),
                  );
                },
              );
            }

            if (state is TopicsError) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
