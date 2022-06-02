part of '../first_screen.dart';

class _AppBar extends StatelessWidget with PreferredSizeWidget {
  const _AppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.color0B1E2D,
      elevation: 0,
      flexibleSpace: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          onChanged: (value) {
            BlocProvider.of<PersonBloc>(context)
                .add(GetPersonEvent(name: value));
          },
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1.2,
          ),
          decoration: InputDecoration(
            prefixIcon: const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 12,
              ),
              child: Icon(
                Icons.search,
                color: AppColors.color5B6975,
                size: 35,
              ),
            ),
            hintStyle: const TextStyle(
              color: AppColors.color5B6975,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 1.2,
            ),
            hintText: 'Найти персонажа',
            filled: true,
            fillColor: Colors.white.withOpacity(0.1),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(50),
            ),
            suffix: FloatingActionButton(
              child: const Icon(Icons.abc),
              elevation: 0,
              backgroundColor: AppColors.color152A3A.withOpacity(0),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
