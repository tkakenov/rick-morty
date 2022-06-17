part of '../preference_screen.dart';

class _BtnItem extends StatelessWidget {
  final String title;
  final Function() onPress;

  const _BtnItem({Key? key, required this.title, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          fixedSize: const Size(double.infinity, 25),
          side: const BorderSide(width: 1, color: AppColors.color22A2BD),
          primary: AppColors.color0B1E2D,
          elevation: 0),
      onPressed: onPress,
      child: Text(
        title,
        style: AppTextStyles.fs16w400Blue,
      ),
    );
  }
}
