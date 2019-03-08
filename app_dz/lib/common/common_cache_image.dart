
  /*
  *
  * 共用的缓存图片
  *
  * */

  import 'package:flutter/material.dart';
  import 'package:cached_network_image/cached_network_image.dart';

  class CacheImageComponent extends StatelessWidget {

    final String imgUrl;
    final BoxFit boxFit;

    const CacheImageComponent({
      @required this.imgUrl,
      this.boxFit = BoxFit.cover
    });

    @override
    Widget build(BuildContext context) {
    // TODO: implement build
      return new CachedNetworkImage(
        key: Key(imgUrl),
        imageUrl: imgUrl.startsWith("http://") ? imgUrl.replaceFirst("http://", "https://") : imgUrl,
        fit: boxFit,
        errorWidget: Image.asset('assets/images/icon_placeholder.png',fit: BoxFit.fill,),
        placeholder: Image.asset('assets/images/icon_placeholder.png',fit: BoxFit.fill,),
      );
    }
  }


