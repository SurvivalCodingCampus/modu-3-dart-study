import 'package:http/testing.dart';

abstract interface class PhotoDataSource {
  Future<List<dynamic>> mockGetPhoto();
}
