import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:modu_3_dart_study/2025-04-07/data_source/impl/photo_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-07/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/2025-04-07/dto/photo_dto.dart';
import 'package:modu_3_dart_study/2025-04-07/model/photo.dart';
import 'package:modu_3_dart_study/2025-04-07/repository/impl/photo_repository_impl.dart';
import 'package:modu_3_dart_study/2025-04-07/repository/photo_repository.dart';
import 'package:modu_3_dart_study/core/result.dart';
import 'package:modu_3_dart_study/enums/photo_error.dart';
import 'package:test/test.dart';

void main() {
  group('사진 API : ', () {
    late PhotoDto dto;
    late PhotoDataSource dataSource;
    late http.Client client;
    late PhotoRepository repository;

    setUpAll(() {
      client = MockClient((request) async {
        if (request.url.toString() == PhotoDataSourceImpl.apiUrl) {
          return http.Response(
            jsonEncode({
              "hits": [
                {
                  "id": 9511704,
                  "pageURL":
                      "https://pixabay.com/photos/sea-moon-night-reflection-city-9511704/",
                  "type": "photo",
                  "tags":
                      "sea, moon, nature, night, reflection, city, fantasy, darling, star, lighthouse, costa, landscape",
                  "previewURL":
                      "https://cdn.pixabay.com/photo/2025/04/03/16/02/sea-9511704_150.jpg",
                  "previewWidth": 150,
                  "previewHeight": 100,
                  "webformatURL":
                      "https://pixabay.com/get/gfac6ba930aa7d8d04c069ed5ba7fa607c21eb81858efe28a4ab65c4d8776aadadbe85379bfd24e9122dba9a630dae6a344e5cf5fdb817714fc74c9f869740f27_640.jpg",
                  "webformatWidth": 640,
                  "webformatHeight": 427,
                  "largeImageURL":
                      "https://pixabay.com/get/g905ae81c174e6ceeabc54391878d5a583c1d88b89a51d7179fec671ab150e10660ea8b2f927c61ab06923515e279e7953fa8a629e47ddf606860b1b806015293_1280.jpg",
                  "imageWidth": 7087,
                  "imageHeight": 4724,
                  "imageSize": 5440183,
                  "views": 2255,
                  "downloads": 1914,
                  "collections": 13,
                  "likes": 63,
                  "comments": 21,
                  "user_id": 3764790,
                  "user": "ELG21",
                  "userImageURL":
                      "https://cdn.pixabay.com/user/2022/04/07/18-24-56-559_250x250.jpg",
                },
                {
                  "id": 9504977,
                  "pageURL":
                      "https://pixabay.com/photos/mountains-sunset-storm-weather-9504977/",
                  "type": "photo",
                  "tags":
                      "mountains, sunset, storm, weather, clouds, ray, darling, rain, lighting, nature, landscape",
                  "previewURL":
                      "https://cdn.pixabay.com/photo/2025/03/31/15/31/mountains-9504977_150.jpg",
                  "previewWidth": 150,
                  "previewHeight": 100,
                  "webformatURL":
                      "https://pixabay.com/get/g3037cf2fe352ec9df1356fb2df8c75a4f8d99164cb9f620d9dbce9fbc0043cc47a1866409c0d4543fa6b8b80823bcd8b4aa4fee8e1d4379b6c786221b7482153_640.jpg",
                  "webformatWidth": 640,
                  "webformatHeight": 427,
                  "largeImageURL":
                      "https://pixabay.com/get/g473602cb312a56f5e3dbf920f5c11c3a3c3fe2457a45c0ab567aad0149d36636001a2b6819d918c830a505851a805f3ed39cdff751cefe87e388be6838603852_1280.jpg",
                  "imageWidth": 7087,
                  "imageHeight": 4724,
                  "imageSize": 3667585,
                  "views": 5484,
                  "downloads": 4884,
                  "collections": 24,
                  "likes": 106,
                  "comments": 40,
                  "user_id": 3764790,
                  "user": "ELG21",
                  "userImageURL":
                      "https://cdn.pixabay.com/user/2022/04/07/18-24-56-559_250x250.jpg",
                },
                {
                  "id": 9512167,
                  "pageURL":
                      "https://pixabay.com/photos/pattern-hearts-blue-bird-leaves-9512167/",
                  "type": "photo",
                  "tags":
                      "pattern, hearts, blue bird, leaves, beautiful wallpaper, summer, wallpaper, background, nature",
                  "previewURL":
                      "https://cdn.pixabay.com/photo/2025/04/03/23/39/pattern-9512167_150.jpg",
                  "previewWidth": 150,
                  "previewHeight": 150,
                  "webformatURL":
                      "https://pixabay.com/get/gd4f5afeaaceabc2519a63cf8b7be56973d8de10d8ea29efbbee76a6fdb51ec3322d7c159dbe3083d127ff4725c089c5cab5d1c292b21fc2a7b2fec4bb959914b_640.jpg",
                  "webformatWidth": 640,
                  "webformatHeight": 640,
                  "largeImageURL":
                      "https://pixabay.com/get/gcb7d207b8cf5c24de429463be123de00bea52e61f66a1d372d1b65bb2c1992e3b27da7be66876e32884ad834802b895148a20a901e61e78fd2c10e9a437dbdc6_1280.jpg",
                  "imageWidth": 3500,
                  "imageHeight": 3500,
                  "imageSize": 905229,
                  "views": 763,
                  "downloads": 699,
                  "collections": 0,
                  "likes": 38,
                  "comments": 20,
                  "user_id": 9214707,
                  "user": "Mollyroselee",
                  "userImageURL":
                      "https://cdn.pixabay.com/user/2024/11/05/10-25-17-681_250x250.jpg",
                },
                {
                  "id": 9512125,
                  "pageURL":
                      "https://pixabay.com/illustrations/proposal-couple-love-romance-9512125/",
                  "type": "illustration",
                  "tags":
                      "proposal, couple, love, romance, romantic, marriage, relationship, engagement, woman, man, silhouette, nature, sunset, propose, happy, sky, clouds, colorful, bright, copy space, greeting card, announcement, save the date",
                  "previewURL":
                      "https://cdn.pixabay.com/photo/2025/04/03/22/11/proposal-9512125_150.jpg",
                  "previewWidth": 105,
                  "previewHeight": 150,
                  "webformatURL":
                      "https://pixabay.com/get/g5a9dc98ebdd20af0ee58575e38818d6f3258e7a4985c61e2eacf0258fbd9c9eb8f36a724e29e4159b4b104939c5bedb05fcc7f2a7f32453b816807405522347f_640.jpg",
                  "webformatWidth": 447,
                  "webformatHeight": 640,
                  "largeImageURL":
                      "https://pixabay.com/get/g540d081ab6a558a54c61b24acd449894a96e1d93e5d46f172bbc9ba2154521cbf896cadfe670314ffecf09c34fcfe15d5aa2287c85aa874a60257f5d3b5ab6f2_1280.jpg",
                  "imageWidth": 2827,
                  "imageHeight": 4052,
                  "imageSize": 891442,
                  "views": 708,
                  "downloads": 602,
                  "collections": 25,
                  "likes": 25,
                  "comments": 14,
                  "user_id": 17475707,
                  "user": "flutie8211",
                  "userImageURL":
                      "https://cdn.pixabay.com/user/2023/05/21/19-38-51-804_250x250.jpg",
                },
                {
                  "id": 9514137,
                  "pageURL":
                      "https://pixabay.com/illustrations/thunderstorm-lightning-clouds-storm-9514137/",
                  "type": "illustration",
                  "tags":
                      "thunderstorm, lightning, clouds, storm, atmosphere, abstract, energy, nature, weather, rain, sky, ai generated",
                  "previewURL":
                      "https://cdn.pixabay.com/photo/2025/04/04/21/32/thunderstorm-9514137_150.jpg",
                  "previewWidth": 150,
                  "previewHeight": 68,
                  "webformatURL":
                      "https://pixabay.com/get/g973e9f5604edcbd10d1af7ccf1854c0df69abdb5211d489d24705ad7ce9940fe68879b41647bdeb41ffd901e3f8446e8a2db7301de0f1fa95f8b4fa41715b783_640.jpg",
                  "webformatWidth": 640,
                  "webformatHeight": 288,
                  "largeImageURL":
                      "https://pixabay.com/get/g0b854d27cb66495312d9ff1ba12455bc11486943b3e3d90872e5267cdd5683776455bde888f71816ad7e0cffd538a3810100d012fdc30d20eea82cc117e7a307_1280.jpg",
                  "imageWidth": 5504,
                  "imageHeight": 2476,
                  "imageSize": 2387510,
                  "views": 419,
                  "downloads": 307,
                  "collections": 8,
                  "likes": 38,
                  "comments": 12,
                  "user_id": 9301,
                  "user": "geralt",
                  "userImageURL":
                      "https://cdn.pixabay.com/user/2022/08/25/06-52-36-900_250x250.jpg",
                },
                {
                  "id": 9511219,
                  "pageURL":
                      "https://pixabay.com/photos/flowers-pollination-bee-entomology-9511219/",
                  "type": "photo",
                  "tags":
                      "flowers, pollination, bee, full hd wallpaper, 4k wallpaper, laptop wallpaper, floral background, desktop backgrounds, entomology, pollinate, beautiful flowers, nature wallpaper, mac wallpaper, winged insects, beekeeping, cool backgrounds, plants, rudbeckia, free wallpaper, wallpaper 4k, echinacea, flower wallpaper, flora, flower background, beautiful wallpaper, garden, close up, colorful, nature, wallpaper, 4k wallpaper 1920x1080, hd wallpaper, nature background, cereal, wallpaper hd, free background, windows wallpaper, beautiful nature, honey bee, insect, bloom",
                  "previewURL":
                      "https://cdn.pixabay.com/photo/2025/04/03/12/00/flowers-9511219_150.jpg",
                  "previewWidth": 150,
                  "previewHeight": 100,
                  "webformatURL":
                      "https://pixabay.com/get/g636504943f2d30dbffdcb7cd26bb0a0b97e14623e18cc28369cafae4258cb760366e5dc3215fff24d3c1791f1465692a237326e252bf76b1a9d1291267c3243e_640.jpg",
                  "webformatWidth": 640,
                  "webformatHeight": 427,
                  "largeImageURL":
                      "https://pixabay.com/get/gb962af9a3cd98265eb5c85f601e281a843afc88d72f8a4c3d876993756ba40f24e7a476624147859275e8be5079875149d23e4ba4e230ef2e8d10772db5c8d18_1280.jpg",
                  "imageWidth": 6000,
                  "imageHeight": 4000,
                  "imageSize": 5284957,
                  "views": 1105,
                  "downloads": 1013,
                  "collections": 0,
                  "likes": 39,
                  "comments": 34,
                  "user_id": 9363663,
                  "user": "Nowaja",
                  "userImageURL":
                      "https://cdn.pixabay.com/user/2020/09/15/15-16-12-52_250x250.jpg",
                },
              ],
            }),
            200,
            headers: {
              HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
            },
          );
        } else {
          return http.Response(
            jsonEncode({'errorMessage': '네트워크 에러지롱'}),
            400,
            headers: {
              HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
            },
          );
        }
      });

      dto = PhotoDto.empty();
      dataSource = PhotoDataSourceImpl(dto, client: client);
      repository = PhotoRepositoryImpl(dataSource, dto);
    });

    test('전체 조회', () async {
      final result = await repository.getPhotos('');

      switch (result) {
        case Success<List<Photo>, PhotoError>():
          expect(result.data.length, 6);
          expect(result.data.first.tags.contains('night'), isTrue);
        case Error<List<Photo>, PhotoError>():
          expect(result.e, isA<PhotoError>());
      }
    });
    test('쿼리 날려먹기', () async {
      final result = await repository.getPhotos('바보');

      switch (result) {
        case Success<List<Photo>, PhotoError>():
          fail('!비속어 포함! 실패해야되는 케이스');
        case Error<List<Photo>, PhotoError>():
          expect(result.e, isA<PhotoError>());
          expect(result.e, PhotoError.slangError);
      }
    });

    test('네트워크 날려먹기', () async {
      dataSource = PhotoDataSourceImpl(httpUrl: 'sdf', dto, client: client);
      repository = PhotoRepositoryImpl(dataSource, dto);

      final result = await repository.getPhotos('');

      switch (result) {
        case Success<List<Photo>, PhotoError>():
          fail('!네트워크 에러! 실패해야되는 케이스');
        case Error<List<Photo>, PhotoError>():
          expect(result.e, isA<PhotoError>());
          expect(result.e, PhotoError.networkError);
      }
    });
  });
}
