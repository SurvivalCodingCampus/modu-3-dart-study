import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/PR2025-03-20/exercise2.dart';
import 'package:modu_3_dart_study/PR2025-04-03/image/data_source/image_data_source.dart';
import 'package:modu_3_dart_study/PR2025-04-03/image/model/uint8list.dart';

//file.writeasbytes = 이미지로 파일 만들 ㅅ 있음
// jsonDeocde(reponse.bodyBytes) 쓰면 이미지도 받을 수 있음

// class ImageDataSourceImpl implements ImageDataSource {
//   @override
//   Future<Uint8list> fetchImage(String url) async {
//     final response = await http.get(
//       Uri.parse(
//         'https://i.namu.wiki/i/BxVtUOkCd3PxA6Z3uNtCCBOdGmRIjuew7PIqMwySvKCQgrHLvT3LdHtUugjukNGTscnUYYjEhleGwvwP7tpLH53tkq9Muhs4-OM4P6Ifr0248pMWqElFv2KZKsaUIrKEFdvzRumcgop_oXEXarcQeQp1WrT_Qlj3Xx-TNMVtIq0.webp',
//       ),
//     );
//     if ((response.statusCode == 200)) {
//       final Uint8list uint8list = jsonDecode(response.bodyBytes);
//     } else {
//       throw Exception('Failed to load upcoming movies');
//     }
//   }
//
//   @override
//   Future<void> saveImage(Uint8list bytes, String path) {
//     // TODO: implement saveImage
//     throw UnimplementedError();
//   }
// }
