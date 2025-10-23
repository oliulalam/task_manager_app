import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NetworkCashedImage extends StatelessWidget {
  const NetworkCashedImage({super.key, required this.url, this.width, this.height, this.fit});

  final String url;
  final double? width;
  final double? height;
  final double? fit;


  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(imageUrl: url, progressIndicatorBuilder: (_,__,___){
      return CircularProgressIndicator();
    },
    errorWidget: (_, __, ___){
      return Icon(Icons.error_outline);
    },
    );
  }
}
