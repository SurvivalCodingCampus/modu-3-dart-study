import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-04-01/solution5/data_source/album_data_source.dart';

class AlbumDataSourceImpl implements AlbumDataSource {
  final File file = File('lib/2025-04-01/solution5/albums.json');

  @override
  List<Map<String, dynamic>> getAlbums() {
    final List<dynamic> jsonList = jsonDecode(file.readAsStringSync());
    return jsonList
        .map((e) => e as Map<String, dynamic>)
        .toList();
  }
}