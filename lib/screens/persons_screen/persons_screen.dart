import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/bloc/peson_bloc.dart';
import 'package:rick_and_morty_app/models/person_response_model.dart';
import 'package:rick_and_morty_app/provider/view_provider.dart';
import 'package:rick_and_morty_app/resources/app_colors.dart';
import 'package:rick_and_morty_app/resources/resources.dart';
import 'package:rick_and_morty_app/screens/detail_screen/detail_person_screen.dart';
import 'package:rick_and_morty_app/utils/app_router.dart';
part 'widgets/persons_list_item.dart';
part 'widgets/persons_grid_item.dart';
part 'widgets/success_body.dart';
part 'widgets/app_bar.dart';

class PersonsScreen extends StatelessWidget {
  const PersonsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ViewProvider(),
      child: Scaffold(
        backgroundColor: AppColors.color0B1E2D,
        appBar: _AppBar(),
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
                        IconButton(
                          icon: Image.asset(
                            context.watch<ViewProvider>().isGridView
                                ? Images.list
                                : Images.grid,
                            height: 24,
                          ),
                          onPressed: () =>
                              context.read<ViewProvider>().changeView(),
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
      ),
    );
  }
}
