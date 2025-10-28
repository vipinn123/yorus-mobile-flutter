// lib/core/widgets/media_display_mixin.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yorus_mobile/domain/entities/media_item.dart';

mixin MediaDisplay<T extends StatefulWidget> on State<T> {
  Widget buildMediaTypeIcon(MediaType mediaType) {
    String assetName;
    switch (mediaType) {
      case MediaType.movie:
        assetName = 'assets/icons/icon_media_movie.svg';
        break;
      case MediaType.book:
        assetName = 'assets/icons/icon_media_book.svg';
        break;
      case MediaType.music:
        assetName = 'assets/icons/icon_media_music.svg';
        break;
      case MediaType.tv:
        assetName = 'assets/icons/icon_media_tv.svg';
        break;
    }
    return SvgPicture.asset(assetName, height: 24, width: 24);
  }

  Widget buildPlaceholderImage() {
    return SvgPicture.asset('assets/icons/placeholder_movie.svg', fit: BoxFit.cover);
  }
}
