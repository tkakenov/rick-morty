import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/bloc/peson_bloc.dart';
import 'package:rick_and_morty_app/data/person_repo.dart';
import 'package:rick_and_morty_app/resources/app_colors.dart';
import 'package:rick_and_morty_app/resources/app_text_styles.dart';

class DetailPersonScreen extends StatelessWidget {
  const DetailPersonScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color0B1E2D,
      body: BlocProvider.value(
        value: PersonBloc(repo: RepositoryProvider.of<PersonRepo>(context))
          ..add(
            GetDetailPersonEvent(id: id),
          ),
        child: BlocBuilder<PersonBloc, PersonState>(
          builder: (context, state) {
            if (state is PersonLoadingState) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }

            if (state is PersonSuccessState) {
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: AppColors.color0B1E2D,
                    expandedHeight: 218,
                    flexibleSpace: Image.network(
                      state.detail.image ?? '',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        Text(
                          state.detail.name ?? '',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          state.detail.status ?? '',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.green,
                          ),
                        ),
                        const Text(
                            'Главный протагонист мультсериала «Рик и Морти». Безумный ученый, чей алкоголизм, безрассудность и социопатия заставляют беспокоиться семью его дочери.',
                            style: AppTextStyles.fs13w400),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('пол',
                                    style: AppTextStyles.fs12w400),
                                Text(state.detail.gender ?? '',
                                    style: AppTextStyles.fs14w400White),
                              ],
                            ),
                            const SizedBox(width: 25),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('расса',
                                    style: AppTextStyles.fs12w400),
                                Text(state.detail.species ?? '',
                                    style: AppTextStyles.fs14w400White),
                              ],
                            ),
                          ],
                        ),
                        ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          title: const Text('место рождения',
                              style: AppTextStyles.fs12w400),
                          subtitle: Text(state.detail.origin!.name ?? '',
                              style: AppTextStyles.fs14w400White),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                        ),
                        ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          title: const Text('местоположение',
                              style: AppTextStyles.fs12w400),
                          subtitle: Text(state.detail.location!.name ?? '',
                              style: AppTextStyles.fs14w400White),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                        ),
                        const Divider(
                          thickness: 2,
                          color: AppColors.color152A3A,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Эпизоды', style: AppTextStyles.fs20w500),
                            Text('Все эпизоды', style: AppTextStyles.fs12w400)
                          ],
                        ),
                        ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 16,
                          ),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.detail.episode!.length,
                          itemBuilder: (context, index) => ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                'https://cdn.vox-cdn.com/thumbor/_BtcO27bO0CA-cC4uYGZSQ_WR1U=/254x0:1874x1215/1820x1213/filters:focal(254x0:1874x1215):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/46828504/RAM_S2_Ep205.0.0.jpg',
                                height: 74,
                                width: 74,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: const Text(
                              'Серия 1',
                              style: AppTextStyles.fs10w500Blue,
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('subtitle',
                                    style: AppTextStyles.fs16w500White),
                                Text(
                                  'subtitle',
                                  style: AppTextStyles.fs14w400Grey,
                                ),
                              ],
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
