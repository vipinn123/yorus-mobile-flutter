// lib/data/local/models/media_item_model.dart
import 'package:isar/isar.dart';

part 'media_item_model.g.dart'; // Generated file for Isar

@collection
class MediaItem {
  Id id = Isar.autoIncrement; // Isar ID
  String? externalId; // e.g., TMDB ID, Spotify ID
  String? title;
  String? mediaType; // 'movie', 'book', 'music', 'tv'
  String? imageUrl;
  // Add more fields as needed for your local storage
}