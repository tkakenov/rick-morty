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
      body: BlocBuilder<PersonBloc, PersonState>(builder: (context, state) {
        if (state is PersonLoadingState) {
          return const CircularProgressIndicator();
        }

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
                      'ВСЕГО ПЕРСОНАЖЕЙ: ${state.result!.length}',
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
                  child: ListView.separated(
                      itemBuilder: (context, index) =>
                          UserItem(model: state.result![index]),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 24,
                          ),
                      itemCount: state.result!.length),
                ),
              ],
            ),
          );
        }
        if (state is PersonErrorState) {
          return Center(
            child: Container(
              height: 100,
              width: 100,
              color: Colors.red,
            ),
          );
        }

        return const SizedBox.shrink();
      }),
    );
  }
}
