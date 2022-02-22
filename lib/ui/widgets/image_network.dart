import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:valbury/ui/ui.dart';
import 'package:valbury/utils/utils.dart';

class ImageNetwork extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final double? radius;

  const ImageNetwork({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(radius ?? Dimens.cornerRadius),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              Dimens.cornerRadius,
            ),
          ),
          border: Border.all(
            color: Theme.of(context).focusColor.withOpacity(0.15),
          ),
        ),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          width: width ?? double.infinity,
          height: height ?? context.widthInPercent(50),
          fadeInDuration: const Duration(milliseconds: 300),
          imageUrl: imageUrl,
          placeholder: (context, url) => const CupertinoActivityIndicator(),
        ),
      ),
    );
  }
}
