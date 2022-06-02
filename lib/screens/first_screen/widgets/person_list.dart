part of '../first_screen.dart';

class _SuccessBody extends StatelessWidget {
  const _SuccessBody({Key? key, required this.models, required this.isLoading})
      : super(key: key);

  final List<Results> models;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    late bool shouldLoadNextPage = isLoading;
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
                    child: PersonItem(model: models[index]));
              },
              childCount: models.length,
            ),
          ),
          if (isLoading)
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
      ),
    );
  }
}
