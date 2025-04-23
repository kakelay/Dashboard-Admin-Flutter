import 'package:admin_dashboard/app/cores/repos/core.dart';
import 'package:admin_dashboard/app/cores/themes/container_decoration.dart';
import 'package:admin_dashboard/app/cores/utils/asset_helper.dart';
import 'package:admin_dashboard/app/cores/values/app_colors.dart';
import 'package:admin_dashboard/app/modules/shared_widgets/image/base_shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

 
Widget ImageWidget({
  String? url,
  String? imgpath,
  double? height,
  double? width,
  BoxFit fit = BoxFit.cover,
  Color? color,
  Color borderColor = Colors.transparent,
  bool isUserProfile = false,
  double borderRadius = 0,
  double widthImages = 2,
  String? fileName,
}) {
  final imagePlaceHolder = BaseShimmerWidget(
    child: Container(
      decoration: ContainerDecoration.rounded(
        borderRadius: borderRadius,
        fillColor: AppColors.white,
      ),
      height: height,
      width: width ?? (height == null ? null : height * 9 / 16),
    ),
  );

  // final errorImageWidget = Image.asset(
  //   AssetHelper.imagePath(
  //     isUserProfile ? 'empty_image_circle.png' : 'empty_image_circle.png',
  //   ),
  //   fit: BoxFit.cover,
  // );
  final errorImageWidget = SvgPicture.asset(
    AssetHelper.SvgAsset(
      isUserProfile ? 'empty_image_circle.svg' : 'empty_image_circle.svg',
    ),
    fit: BoxFit.cover,
  );

  // String? cacheKey;
  // if (url != null) {
  //   final uri = Uri.parse(url);
  //   String queryData = uri.query;
  //   queryData = queryData.substring(0, queryData.indexOf('?'));
  //   if (queryData.isNotEmpty) cacheKey = queryData;
  // }
  if (fileName.toString().checkNullString().split('.').last.toLowerCase() ==
      'svg') {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: SvgPicture.network(
        url!,
        fit: fit,
        color: color,
        height: height,
        width: width,
        placeholderBuilder: (context) => imagePlaceHolder,
      ),
    );
  }
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: borderColor, width: widthImages),
      borderRadius: BorderRadius.circular(borderRadius),
    ),
    // padding: EdgeInsets.all(1),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: (url == null)
          ? Image.asset(
              imgpath!,
              fit: fit,
              color: color,
              height: height,
              width: width,
            )
          : CachedNetworkImage(
              // cacheKey: cacheKey,
              imageUrl: url,
              fit: fit,
              color: color,
              height: height,
              width: width,
              errorWidget: (context, url, error) => errorImageWidget,
              // placeholder: (context, url) => imagePlaceHolder,
              progressIndicatorBuilder: (context, url, progress) {
                return imagePlaceHolder;
              },
            ),
    ),
  );
}
