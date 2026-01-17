import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nova/core/widgets/fade_slide.dart';
import 'package:flutter_nova/features/questions/presentations/bloc/question_bloc.dart';
import 'package:flutter_nova/features/questions/presentations/bloc/question_event.dart';
import 'package:flutter_nova/features/questions/presentations/bloc/question_state.dart';
import 'package:flutter_nova/features/questions/presentations/widgets/question_tile.dart';

class QuestionsPage extends StatelessWidget {
  final String topicId;
  final String topicTitle;

  const QuestionsPage({
    super.key,
    required this.topicId,
    required this.topicTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: BlocBuilder<QuestionsBloc, QuestionsState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              // 1️⃣ SLIVER APP BAR
              SliverAppBar(
                pinned: true,
                floating: true,
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
                title: Text(topicTitle),
              ),

              // 2️⃣ SEARCH BAR (SEPARATE SLIVER ✅)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Search questions...',
                      hintStyle: const TextStyle(color: Colors.white70),
                      prefixIcon: const Icon(Icons.search, color: Colors.white),
                      suffixIcon:
                          state is QuestionsLoaded &&
                              state.searchQuery.isNotEmpty
                          ? IconButton(
                              icon: const Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                context.read<QuestionsBloc>().add(
                                  ClearSearch(topicId),
                                );
                              },
                            )
                          : null,
                      filled: true,
                      fillColor: Theme.of(
                        context,
                      ).colorScheme.primary.withOpacity(0.9),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) {
                      context.read<QuestionsBloc>().add(
                        SearchQuestions(query: value, topicId: topicId),
                      );
                    },
                  ),
                ),
              ),

              // 3️⃣ SPACE BELOW SEARCH BAR (NOW VISIBLE ✅)
              const SliverToBoxAdapter(child: SizedBox(height: 12)),

              // 4️⃣ BODY STATES
              if (state is QuestionsLoading)
                const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                ),

              if (state is QuestionsLoaded)
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 80),
                  sliver: SliverList.separated(
                    itemCount: state.questions.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 14),
                    itemBuilder: (context, index) {
                      final question = state.questions[index];
                      return FadeSlide(
                        delay: index * 60,
                        child: QuestionTile(question: question, index: index),
                      );
                    },
                  ),
                ),

              if (state is QuestionsError)
                SliverFillRemaining(
                  child: Center(
                    child: Text(
                      state.message,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
