import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/utilies/styles.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem(this.list, this.index, {super.key});
  final List list;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()async
      {
        Uri uri = Uri.parse(list[index]['url']);
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
                    imageUrl: '${list[index]['urlToImage']}',
                  fit: BoxFit.fill,
                  height: 120,
                  width: 120,
                  placeholder: (context, url) => const Center(child: CircularProgressIndicator(),),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${list[index]['title']}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${list[index]['description']}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: Styles.textStyle14,
                    ),
                    const Spacer(),
                    Text(
                      '${list[index]['publishedAt']}',
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
