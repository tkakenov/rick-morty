import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/resources/app_colors.dart';
import 'package:rick_and_morty_app/resources/app_text_styles.dart';
import 'package:rick_and_morty_app/resources/resources.dart';
import 'package:rick_and_morty_app/screens/edit_name_screen/edit_login_screen.dart';
import 'package:rick_and_morty_app/screens/edit_name_screen/edit_name_screen.dart';
part 'widgets/editing_element.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.color0B1E2D,
        appBar: AppBar(
          backgroundColor: AppColors.color0B1E2D,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_outlined),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text('Редактировать профиль'),
          centerTitle: false,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  child: Image.asset(
                    Images.avatar,
                    height: 150,
                    width: 150,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Изменить фото',
                    style: AppTextStyles.fs16w400Blue,
                    textAlign: TextAlign.center),
                const SizedBox(height: 40),
                const Text('ПРОФИЛЬ', style: AppTextStyles.fs10w500Grey),
                const SizedBox(height: 24),
                _EditingElement(
                  title: 'Изменить ФИО',
                  subtitle: 'Oleg Belotserkovsky',
                  onPress: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditNameScreen(),
                    ),
                  ),
                ),
                _EditingElement(
                  title: 'Логин',
                  subtitle: 'Rick',
                  onPress: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditLoginScreen(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
