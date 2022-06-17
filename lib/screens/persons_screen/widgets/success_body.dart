part of '../persons_screen.dart';

class _SuccessBody extends StatefulWidget {
  const _SuccessBody({
    Key? key,
    required this.models,
    required this.isLoading,
  }) : super(key: key);

  final List<Results> models;
  final bool isLoading;

  @override
  State<_SuccessBody> createState() => _SuccessBodyState();
}

class _SuccessBodyState extends State<_SuccessBody> {
  int pageNumber = 0;

  @override
  Widget build(BuildContext context) {
    late bool shouldLoadNextPage = widget.isLoading;
    return NotificationListener(
      onNotification: (ScrollNotification notification) {
        final current = notification.metrics.pixels + 100;
        final max = notification.metrics.maxScrollExtent;
        if (current >= max && !shouldLoadNextPage) {
          shouldLoadNextPage = true;
          pageNumber++;
          BlocProvider.of<PersonBloc>(context).add(
            GetPersonEvent(pageNumber: pageNumber),
          );
        }
        return true;
      },
      child: CustomScrollView(
        slivers: [
          context.watch<ViewProvider>().isGridView
              ? SliverGrid(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200.0,
                    mainAxisSpacing: 30.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 0.8,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return GestureDetector(
                          onTap: () => AppRouter.push(
                                context,
                                DetailPersonScreen(
                                    id: widget.models[index].id ?? 0),
                              ),
                          child: _PersonsGridItem(
                            model: widget.models[index],
                          ));
                    },
                    childCount: widget.models.length,
                  ),
                )
              : SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 22,
                          ),
                          child: GestureDetector(
                              onTap: () => AppRouter.push(
                                    context,
                                    DetailPersonScreen(
                                        id: widget.models[index].id ?? 0),
                                  ),
                              child: _PersonsListItem(
                                model: widget.models[index],
                              )));
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
      ),
    );
  }
}
