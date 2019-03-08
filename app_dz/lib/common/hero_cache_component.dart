

  /*
  *
  * 二次封装
  * */
  import 'package:flutter/material.dart';
  import 'package:app_dz/models/pood/video_model.dart';
  import 'package:app_dz/common/common_cache_image.dart';


  class HeroComponent extends StatelessWidget {

    final VideoModel itemData;
    final double imageWidth, imageHeight;

    const HeroComponent({
      @required this.itemData,
      this.imageWidth = 200.0,
      this.imageHeight = 400.0,
    });


    @override
    Widget build(BuildContext context) {
      String thumbnail = itemData.thumbnail;
      // TODO: implement build
      if (thumbnail.startsWith("http://")) {
        thumbnail = thumbnail.replaceFirst("http://", "https://");
      }
      if (itemData.timestamp == null) {
        itemData.timestamp = "-default";
      }
      return SizedBox(
        width: imageWidth,
        height: imageHeight,
        child: Hero(
          key: Key(itemData.id),
          tag: "${itemData.id}${itemData.timestamp}",
          child: CacheImageComponent(imgUrl: thumbnail),
        ),
      );
    }

  }