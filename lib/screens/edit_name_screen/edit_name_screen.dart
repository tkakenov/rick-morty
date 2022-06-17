import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/resources/app_colors.dart';

class EditNameScreen extends StatelessWidget {
  const EditNameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color0B1E2D,
      appBar: AppBar(
        backgroundColor: AppColors.color0B1E2D,
        elevation: 0,
        title: const Text('Изменить ФИО'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(),
    );
  }
}
