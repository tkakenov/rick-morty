import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/resources/app_colors.dart';

class EpisodsScreen extends StatelessWidget {
  const EpisodsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.color0B1E2D,
        appBar: AppBar(
          backgroundColor: AppColors.color0B1E2D,
          elevation: 0,
        ),
        body: const SizedBox.shrink());
  }
}
