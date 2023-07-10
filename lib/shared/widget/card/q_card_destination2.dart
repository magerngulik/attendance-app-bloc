import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../container/q_box_container/q_shimmer_text.dart';

class QCardDestination extends StatelessWidget {
  final String image;
  final int price;
  final String title;
  final String location;
  final double rating;
  const QCardDestination({
    Key? key,
    required this.image,
    required this.price,
    required this.title,
    required this.location,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            16.0,
          ),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: CachedNetworkImage(
              imageUrl: image,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(
                      16.0,
                    ),
                  ),
                ),
              ),
              placeholder: (context, url) => const QShimmerText(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title.toString(),
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.star,
                size: 18.0,
                color: Colors.orange,
              ),
              Text(
                rating.toString(),
                style: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.location_on,
                size: 15.0,
                color: Colors.grey,
              ),
              Text(
                location,
                style: const TextStyle(
                  fontSize: 15.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Divider()
        ],
      ),
    );
  }
}
