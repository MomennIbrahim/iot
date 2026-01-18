import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ImageSourceType { asset, network, cachedNetwork, svg, file }

class AppImage extends StatelessWidget {
  final String imagePath;
  final ImageSourceType sourceType;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? color; // Useful for coloring SVG images or icons

  const AppImage({
    super.key,
    required this.imagePath,
    required this.sourceType,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    switch (sourceType) {
      case ImageSourceType.asset:
        return Image.asset(
          imagePath,
          width: width?.w,
          height: height?.h,
          fit: fit,
          color: color,
        );
      case ImageSourceType.network:
        return Image.network(
          imagePath,
          width: width?.w,
          height: height?.h,
          fit: fit,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(child: CircularProgressIndicator());
          },
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
        );
      case ImageSourceType.cachedNetwork:
        return CachedNetworkImage(
          imageUrl: imagePath,
          width: width?.w,
          height: height?.h,
          fit: fit,
          placeholder: (context, url) => const SizedBox.shrink(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        );
      case ImageSourceType.svg:
        return SvgPicture.asset(
          imagePath,
          width: width?.w,
          height: height?.h,
          fit: fit,
          colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
          placeholderBuilder: (BuildContext context) =>
              const Center(child: CircularProgressIndicator()),
        );
      case ImageSourceType.file:
        return Image.file(
          File(imagePath),
          width: width?.w,
          height: height?.h,
          fit: fit,
        );
    }
  }
}
