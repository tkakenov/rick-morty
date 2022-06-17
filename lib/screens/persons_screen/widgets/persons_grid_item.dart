part of '../persons_screen.dart';

class _PersonsGridItem extends StatelessWidget {
  const _PersonsGridItem({Key? key, required this.model}) : super(key: key);

  final Results model;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.network(
            model.image!,
            height: 120,
            width: 122,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        Text(
          model.status!,
          style: const TextStyle(
              color: AppColors.color43D049,
              fontSize: 10,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.5,
              height: 1.6),
        ),
        Text(
          model.name!,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
            height: 1.5,
          ),
        ),
        Expanded(
          child: Text(
            '${model.species!}, ${model.gender!}',
            style: const TextStyle(
                color: AppColors.color6E798C,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.3),
          ),
        ),
      ],
    );
  }
}
