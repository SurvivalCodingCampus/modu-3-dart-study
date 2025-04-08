import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-07/core/photo_error.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-07/data_source/http_image_data_source.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-07/model/photo.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-07/repository/http_photo_repository.dart';
import 'package:modu_3_dart_study/core/result.dart';
import 'package:test/test.dart';

void main() {
  final http.Client client = http.Client();
  final HttpImageDataSource dataSource = HttpImageDataSource(client);
  final HttpPhotoRepository repository = HttpPhotoRepository(dataSource);

  test('getPhotos() 호출이 성공해야한다.', () async {
    final Result<List<Photo>, PhotoError> photos = await repository.getPhotos(
      'yellow',
    );

    expect(photos, isA<Success<List<Photo>, PhotoError>>());
  });

  test('getPhotos()를 비속어 사용하며 호출 시 실패해야한다.', () async {
    final Result<List<Photo>, PhotoError> photos = await repository.getPhotos(
      '바보',
    );

    expect(
      photos,
      Result<List<Photo>, PhotoError>.failure(PhotoError.profanityError),
    );
  });

  test('네트워크 에러 시 PhotoError.networkError를 반환해야한다.', () async {
    // Given
    final Map<String, dynamic> data = {
      "hits": [
        {
          "id": 926728,
          "pageURL":
              "https://pixabay.com/photos/yellow-wall-girl-woman-hipster-926728/",
          "type": "photo",
          "tags":
              "yellow, wall, girl, woman, hipster, person, walking, fashion, female, copy space, yellow wall, yellow, yellow, yellow, yellow, yellow, wall, wall, wall, girl, person, walking, fashion",
          "previewURL":
              "https://cdn.pixabay.com/photo/2015/09/06/00/46/yellow-926728_150.jpg",
          "previewWidth": 150,
          "previewHeight": 99,
          "webformatURL":
              "https://pixabay.com/get/g722094c0331b7533ada18727428ad471ca444a9be87760caf600bf7ac57b469bdf34d0c6aae4635f34ad008edc36d46a_640.jpg",
          "webformatWidth": 640,
          "webformatHeight": 426,
          "largeImageURL":
              "https://pixabay.com/get/gd41359dd9f75ce5e36b658f135ac70d2f558534b87e7fd31fadb6d29a48a723d61fe988424d8ec7abee729a237d2d6255fa2dc51fdc24d44371e1b13afee34fb_1280.jpg",
          "imageWidth": 5852,
          "imageHeight": 3901,
          "imageSize": 3148492,
          "views": 861698,
          "downloads": 499763,
          "collections": 1828,
          "likes": 1622,
          "comments": 288,
          "user_id": 894430,
          "user": "StockSnap",
          "userImageURL":
              "https://cdn.pixabay.com/user/2015/03/30/12-22-31-508_250x250.jpg",
        },
        {
          "id": 7679117,
          "pageURL":
              "https://pixabay.com/photos/flower-stamens-hypericum-macro-7679117/",
          "type": "photo",
          "tags":
              "flower, stamens, hypericum, beautiful flowers, macro, flower background, yellow, flower, yellow, yellow, yellow, yellow, nature, flower wallpaper, yellow",
          "previewURL":
              "https://cdn.pixabay.com/photo/2022/12/26/13/50/flower-7679117_150.jpg",
          "previewWidth": 150,
          "previewHeight": 100,
          "webformatURL":
              "https://pixabay.com/get/g53bb305c6b229a8dc7b22d73547456e5eea49752fb29865f734bfbc7f394534f2ad3963b9fb688c6dfb7d83bad4c10ec14c9761b032eab5763a53e78f4b87124_640.jpg",
          "webformatWidth": 640,
          "webformatHeight": 427,
          "largeImageURL":
              "https://pixabay.com/get/ga9845579002506768b9433f6ca4a7f96d9a43bab963848c21444bb9b7265cc79b0df4af54916de44bf1211e6fa3793ab6db31c7ff9056ec150bbe9446eee15cf_1280.jpg",
          "imageWidth": 6000,
          "imageHeight": 4000,
          "imageSize": 8137356,
          "views": 28559,
          "downloads": 22057,
          "collections": 853,
          "likes": 123,
          "comments": 21,
          "user_id": 4379051,
          "user": "4379051",
          "userImageURL": "",
        },
        {
          "id": 7868085,
          "pageURL":
              "https://pixabay.com/photos/butterfly-insect-pollination-7868085/",
          "type": "photo",
          "tags":
              "butterfly, insect, pollination, multicoloured, nature, summer, meadow, spring, orange, yellow, yellow flowers, summer, summer, summer, summer, summer, spring, yellow, yellow, yellow, yellow, yellow, yellow flowers",
          "previewURL":
              "https://cdn.pixabay.com/photo/2023/03/21/19/58/butterfly-7868085_150.jpg",
          "previewWidth": 150,
          "previewHeight": 100,
          "webformatURL":
              "https://pixabay.com/get/g7435a3ac0519cac0285107cb4cbad5ff1a927c07c5340b6acc52961d45ebc36292f4d73fa6c8d7dc668db663b0e2d3071a2f43a66e33892e4a12e762aaa70b1e_640.jpg",
          "webformatWidth": 640,
          "webformatHeight": 427,
          "largeImageURL":
              "https://pixabay.com/get/g4c1c34382f3c39f0093f2d97bc42dc49ba7f63062edac18f4ae5c047b51b78d2f7a5307ba48d76c0ee5b3e8494d44da4d7b04d266ab59d5cab0538c71d7fde08_1280.jpg",
          "imageWidth": 5184,
          "imageHeight": 3456,
          "imageSize": 3267223,
          "views": 7864,
          "downloads": 5921,
          "collections": 307,
          "likes": 57,
          "comments": 6,
          "user_id": 6877379,
          "user": "Sommerland",
          "userImageURL":
              "https://cdn.pixabay.com/user/2017/10/30/19-04-28-900_250x250.jpg",
        },
        {
          "id": 2107024,
          "pageURL":
              "https://pixabay.com/photos/crocus-flowers-yellow-bloom-2107024/",
          "type": "photo",
          "tags":
              "crocus, flower background, flowers, yellow, bloom, blossom, yellow flowers, petals, yellow petals, spring flowers, flowering plants, plants, spring, meadow, early bloomer, springtime, harbinger of spring, flower wallpaper, crocus, flowers, yellow, yellow, beautiful flowers, yellow, yellow, yellow, yellow flowers, yellow flowers, nature, yellow flowers, yellow flowers, spring, springtime",
          "previewURL":
              "https://cdn.pixabay.com/photo/2017/02/28/22/37/crocus-2107024_150.jpg",
          "previewWidth": 150,
          "previewHeight": 99,
          "webformatURL":
              "https://pixabay.com/get/g62a2ab9c941a49e04cbffce79bb72d52d01caffa7528eb6ef7c13b8aa288c05973aaf78b744b7928568c5d67aeaf1f997f6bd2ff476e37ba8e79b7e8af9eb9df_640.jpg",
          "webformatWidth": 640,
          "webformatHeight": 426,
          "largeImageURL":
              "https://pixabay.com/get/gcb63054a2a1b69729dfae19487c0c1cd66b59d4afaff98f4d5c26222dce3d139c441c78ae18e8350fe87afa62c937f1b5baf79c1d8a39368ec69e320d81402f0_1280.jpg",
          "imageWidth": 4896,
          "imageHeight": 3264,
          "imageSize": 2596169,
          "views": 113695,
          "downloads": 73134,
          "collections": 1433,
          "likes": 305,
          "comments": 51,
          "user_id": 1195798,
          "user": "Couleur",
          "userImageURL":
              "https://cdn.pixabay.com/user/2025/02/22/14-13-17-25_250x250.jpg",
        },
        {
          "id": 4750726,
          "pageURL":
              "https://pixabay.com/photos/flower-petals-bloom-yellow-yellow-4750726/",
          "type": "photo",
          "tags":
              "flower, petals, bloom, beautiful flowers, yellow, yellow, yellow, yellow, flower wallpaper, yellow, nature, flower background, yellow",
          "previewURL":
              "https://cdn.pixabay.com/photo/2020/01/08/17/32/flower-4750726_150.jpg",
          "previewWidth": 150,
          "previewHeight": 99,
          "webformatURL":
              "https://pixabay.com/get/g8d5c33e49bc36028d2c5eaec65c89cd8f809a4964503eb90abc9ea1b2f270dbac9123128e13b24bf5a479222d28cc1a96b2890cde18855ff83615d45d8bf8100_640.jpg",
          "webformatWidth": 640,
          "webformatHeight": 425,
          "largeImageURL":
              "https://pixabay.com/get/gdca3d51ebc96c6d42d356684f5830cbd943e6d1c2b925dc9597ac2a056821294992797c478a6517dd52ec18671305bb7c24da5209e7652f992d97e576c12eba7_1280.jpg",
          "imageWidth": 3008,
          "imageHeight": 2000,
          "imageSize": 1453867,
          "views": 12223,
          "downloads": 8520,
          "collections": 522,
          "likes": 67,
          "comments": 25,
          "user_id": 14174246,
          "user": "Zotx",
          "userImageURL":
              "https://cdn.pixabay.com/user/2019/11/20/20-56-12-836_250x250.jpg",
        },
        {
          "id": 6188414,
          "pageURL":
              "https://pixabay.com/photos/flowers-yellow-spring-6188414/",
          "type": "photo",
          "tags":
              "flowers, yellow, spring, yellow flowers, bloom, nature, blossom, petals, flora, beautiful flowers, plant, flower wallpaper, flower background, garden, flowers, yellow, yellow, yellow, yellow, yellow, spring, yellow flowers, yellow flowers, yellow flowers, nature, nature, garden",
          "previewURL":
              "https://cdn.pixabay.com/photo/2021/04/18/13/35/flowers-6188414_150.jpg",
          "previewWidth": 150,
          "previewHeight": 100,
          "webformatURL":
              "https://pixabay.com/get/g8309be0c49ce770858426f56b565940be028418fac8064d12a50ea7f62cd4d9635259acd96f469e61e6c9918fb2ef279612f8afc782b14e0c86d72debfc77ccf_640.jpg",
          "webformatWidth": 640,
          "webformatHeight": 427,
          "largeImageURL":
              "https://pixabay.com/get/g84928192ca7d0af4cd826e5302aeb1720b0ecd8cd662ecb86a69c7b09cc3cf3aad92218c0e93e7602306e1267e7d5bb3afc7cfbdfc738d1a3e3273f649d425a4_1280.jpg",
          "imageWidth": 4608,
          "imageHeight": 3072,
          "imageSize": 2161122,
          "views": 11817,
          "downloads": 9101,
          "collections": 393,
          "likes": 65,
          "comments": 11,
          "user_id": 20016734,
          "user": "didssph",
          "userImageURL":
              "https://cdn.pixabay.com/user/2021/01/25/10-53-31-890_250x250.jpeg",
        },
      ],
    };

    final http.Client client = MockClient(
      (request) async => http.Response(jsonEncode(data), 500),
    );

    final HttpImageDataSource dataSource = HttpImageDataSource(client);
    final HttpPhotoRepository repository = HttpPhotoRepository(dataSource);

    final Result<List<Photo>, PhotoError> photos = await repository.getPhotos(
      'yellow',
    );

    expect(
      photos,
      Result<List<Photo>, PhotoError>.failure(PhotoError.networkError),
    );
  });
}
