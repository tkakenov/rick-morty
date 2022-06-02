import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/bloc/peson_bloc.dart';
import 'package:rick_and_morty_app/models/person_response_model.dart';
import 'package:rick_and_morty_app/resources/app_colors.dart';
import 'package:rick_and_morty_app/screens/detail/detail_person_screen.dart';
import 'package:rick_and_morty_app/utils/app_router.dart';
part 'widgets/app_bar.dart';
part 'widgets/person_item.dart';
part 'widgets/person_list.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color0B1E2D,
      appBar: const _AppBar(),
      body: BlocBuilder<PersonBloc, PersonState>(
        builder: (context, state) {
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
                        heroTag: 'btn1',
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
