import 'package:flutter/material.dart';
import '../../../../../core/utilies/styles.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'title',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Styles.textStyle20.copyWith(fontWeight: FontWeight.w600),
                  ),
                  const Text(
                    'description',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Styles.textStyle16,
                  ),
                  const Spacer(),
                  Text(
                    'date', style: Styles.textStyle18.copyWith(color: Colors.grey),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
