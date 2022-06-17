part of '../persons_screen.dart';

class _AppBar extends StatelessWidget with PreferredSizeWidget {
  _AppBar({Key? key}) : super(key: key);

  String nameValue = '';
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.color0B1E2D,
      elevation: 0,
      flexibleSpace: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          onChanged: (value) {
            nameValue = value;
          },
          textAlignVertical: TextAlignVertical.bottom,
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
            suffixIcon: Padding(
              padding: const EdgeInsetsDirectional.only(end: 20),
              child: IconButton(
                icon: Image.asset(Images.funel1),
                onPressed: () {
                  BlocProvider.of<PersonBloc>(context).add(
                    GetPersonEvent(name: nameValue, isForSearch: true),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
