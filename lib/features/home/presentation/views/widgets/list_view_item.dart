import 'package:flutter/material.dart';
import 'package:ibrahim_project/features/home/data/news_model/Articles.dart';
import '../../../../../core/utilies/styles.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem(this.article, {super.key});
  final Articles article;

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
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage('${article.urlToImage}')
                )
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${article.title}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${article.description}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: Styles.textStyle14,
                  ),
                  const Spacer(),
                  Text(
                    '${article.publishedAt}',
                    style: Styles.textStyle14.copyWith(color: Colors.grey),
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
