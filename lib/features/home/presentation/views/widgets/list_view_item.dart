import 'package:bee_1/features/home/data/news_model/news_model/news_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({super.key, required this.newsModel});
  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Uri uri = Uri.parse(newsModel.url?? 'https://example.com/404');
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 6, top: 6),
        child: SizedBox(
          height: 120,
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl: newsModel.urlToImage ?? '',
                errorWidget: (context, url, error) => const Center(
                  child: Icon(Icons.error),
                ),
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                width: 120,
                height: 120,
                fit: BoxFit.fill,
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(newsModel.title??'NoTitle',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    Text(newsModel.description ?? '',
                    style: const TextStyle(fontSize: 13),
                        maxLines: 3, overflow: TextOverflow.ellipsis),
                    const Spacer(),
                    Text(newsModel.publishedAt!,
                        style: const TextStyle(color: Colors.grey)),
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
