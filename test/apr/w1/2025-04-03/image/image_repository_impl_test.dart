import 'package:modu_3_dart_study/apr/w1/2025-04-03/image/data_source/image_data_source_impl.dart';
import 'package:modu_3_dart_study/apr/w1/2025-04-03/image/repository/image_repository_impl.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('image', () async {
    final imageData = ImageDataSourceImpl();
    final repository = ImageRepositoryImpl(imageData);

    const String imageUrl1 =
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcSAw2LyepK5N_hL1RsKWFmJXa-fbYNx7y0g&s';
    const String imageUrl2 =
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGC_lT2YdFU9wAIzo1gPDrFlHI5gf2uhCQnQ&s';
    const String imageUrl3 =
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnfaZ9iOeNc_fmJygqIIszyTPuSv3xy32vhg&s';
    const String path = r'lib/apr/w1/2025-04-03/image/data';
    final List<String> urls = [imageUrl1, imageUrl2, imageUrl3];

    await repository.saveImage(imageUrl3, '$path/image.png');
    await repository.saveImages(urls, path);
  });
}
