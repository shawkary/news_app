import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ibrahim_project/features/home/data/news_model/Articles.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/utilies/styles.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem(this.article, {super.key});
  final Articles article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()async
      {
        Uri uri = Uri.parse(article.url!);
        if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: SizedBox(
          height: 120,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                    imageUrl: article.urlToImage!,
                  fit: BoxFit.fill,
                  height: 120,
                  width: 120,
                  placeholder: (context, url) => const Center(child: CircularProgressIndicator(),),
                  errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      article.description!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Styles.textStyle14,
                    ),
                    const Spacer(),
                    Text(
                      article.publishedAt!,
                      style: Styles.textStyle14.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
