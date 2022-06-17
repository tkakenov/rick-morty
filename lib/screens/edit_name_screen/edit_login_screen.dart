import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/resources/app_colors.dart';

class EditLoginScreen extends StatelessWidget {
  const EditLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color0B1E2D,
      appBar: AppBar(
        backgroundColor: AppColors.color0B1E2D,
        elevation: 0,
        title: const Text('Изменить Логин'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(),
    );
  }
}
