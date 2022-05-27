import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/bloc/peson_bloc.dart';
import 'package:rick_and_morty_app/models/person_response_model.dart';
import 'package:rick_and_morty_app/resources/app_colors.dart';
part 'widgets/app_bar.dart';
part 'widgets/user_item.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color152A3A,
      appBar: const _AppBar(),
      body: BlocBuilder<PersonBloc, PersonState>(
        builder: (context, state) {
          // if (state is PersonLoadingState) {
          //   return const CircularProgressIndicator();
          // }

          if (state is PersonSuccessState) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 15,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'ВСЕГО ПЕРСОНАЖЕЙ: ${state.models.length}',
                        style: const TextStyle(
                          letterSpacing: 1.5,
                          color: AppColors.color5B6975,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      FloatingActionButton(
                        child: const Icon(Icons.view_comfy),
                        backgroundColor: Colors.white.withOpacity(0),
                        elevation: 0,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Expanded(
                    child: _SuccessBody(
                      models: state.models,
                      isLoading: state.isLoading,
                    ),
                  ),
                ],
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class _SuccessBody extends StatefulWidget {
  const _SuccessBody({Key? key, required this.models, required this.isLoading})
      : super(key: key);

  final List<Results> models;
  final bool isLoading;

  @override
  State<_SuccessBody> createState() => __SuccessBodyState();
}

class __SuccessBodyState extends State<_SuccessBody> {
  @override
  void didUpdateWidget(covariant _SuccessBody oldWidget) {
    shouldLoadNextPage = widget.isLoading;
    super.didUpdateWidget(oldWidget);
  }

  late bool shouldLoadNextPage;

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
        onNotification: (ScrollNotification notification) {
          final current = notification.metrics.pixels + 100;
          final max = notification.metrics.maxScrollExtent;
          if (current >= max && !shouldLoadNextPage) {
            shouldLoadNextPage = true;
            BlocProvider.of<PersonBloc>(context).add(GetPersonEvent());
          }
          return true;
        },
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 22,
                      ),
                      child: UserItem(model: widget.models[index]));
                },
                childCount: widget.models.length,
              ),
            ),
            if (widget.isLoading)
              const SliverPadding(
                padding: EdgeInsets.only(top: 10),
                sliver: SliverToBoxAdapter(
                  child: SizedBox(
                    height: 80,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: CircularProgressIndicator.adaptive(
                        valueColor: AlwaysStoppedAnimation(Colors.blue),
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
          ],
        )

        // ListView.separated(
        //   itemBuilder: (context, index) => UserItem(model: widget.models[index]),
        //   separatorBuilder: (context, index) => const SizedBox(
        //     height: 24,
        //   ),
        //   itemCount: widget.models.length,
        // ),
        );
  }
}
