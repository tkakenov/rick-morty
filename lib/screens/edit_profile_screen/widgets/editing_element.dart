part of '../edit_profile_screen.dart';

class _EditingElement extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function() onPress;

  const _EditingElement({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      title: Text(title, style: AppTextStyles.fs16w500White),
      subtitle: Text(subtitle, style: AppTextStyles.fs14w400Grey),
      trailing: IconButton(
        onPressed: onPress,
        icon: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
          size: 15,
        ),
      ),
    );
  }
}
