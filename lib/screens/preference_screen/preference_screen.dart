import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/resources/app_colors.dart';
import 'package:rick_and_morty_app/resources/app_text_styles.dart';
import 'package:rick_and_morty_app/resources/resources.dart';
import 'package:rick_and_morty_app/screens/edit_profile_screen/edit_profile_screen.dart';
part 'widgets/btn_item.dart';

class PreferenceScreen extends StatelessWidget {
  const PreferenceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color0B1E2D,
      appBar: AppBar(
        backgroundColor: AppColors.color0B1E2D,
        leading: const Icon(Icons.arrow_back_outlined),
        title: const Text('Настройки'),
        centerTitle: false,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Image.asset(
                    Images.avatar,
                    width: 80,
                    height: 80,
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Timur Kakenov', style: AppTextStyles.fs16w500White),
                      SizedBox(height: 4),
                      Text('Rick', style: AppTextStyles.fs14w400Grey),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              _BtnItem(
                title: 'Редактировать',
                onPress: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditProfileScreen(),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              const Divider(color: AppColors.color152A3A),
              const SizedBox(height: 36),
              const Text('ВНЕШНИЙ ВИД', style: AppTextStyles.fs10w500Grey),
              const SizedBox(height: 24),
              const ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: Icon(
                  Icons.palette_outlined,
                  color: Colors.white,
                  size: 36,
                ),
                title: Text(
                  'Темная тема',
                  style: AppTextStyles.fs16w500White,
                ),
                subtitle: Text(
                  'Включена',
                  style: AppTextStyles.fs14w400Grey,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 15,
                ),
              ),
              const SizedBox(height: 36),
              const Divider(color: AppColors.color152A3A),
              const SizedBox(height: 36),
              const Text('О ПРИЛОЖЕНИИ', style: AppTextStyles.fs10w500Grey),
              const SizedBox(height: 24),
              const Text(
                'Зигерионцы помещают Джерри и Рика в симуляцию, чтобы узнать секрет изготовления концен-трирован- ной темной материи.',
                style: AppTextStyles.fs13w400White,
              ),
              const SizedBox(height: 36),
              const Divider(color: AppColors.color152A3A),
              const SizedBox(height: 36),
              const Text('ВЕРСИЯ ПРИЛОЖЕНИЯ',
                  style: AppTextStyles.fs10w500Grey),
              const SizedBox(height: 24),
              const Text(
                'Rick & Morty  v1.0.0',
                style: AppTextStyles.fs13w400White,
              )
            ],
          ),
        ),
      ),
    );
  }
}
