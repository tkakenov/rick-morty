part of '../persons_screen.dart';

class _PersonsListItem extends StatelessWidget {
  const _PersonsListItem({Key? key, required this.model}) : super(key: key);

  final Results model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.network(
            model.image!,
            height: 74,
            width: 74,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: 18,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5,
                height: 1.5,
              ),
            ),
            Text(
              '${model.species!}, ${model.gender!}',
              style: const TextStyle(
                  color: AppColors.color6E798C,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.3),
            ),
          ],
        ),
      ],
    );
  }
}
