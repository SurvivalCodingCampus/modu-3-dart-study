import 'data_source/image_data_source_impl.dart';
import 'repository/image_repository_impl.dart';

void main() async {
  final imagePath = 'assignments/2025_04_03/solution2/image/cat.jpg';
  final imageDirectory =
      'C:/Users/Ujun/modu-3-dart-study/assignments/2025_04_03/solution2/image';
  final url =
      'https://i.namu.wiki/i/d1A_wD4kuLHmOOFqJdVlOXVt1TWA9NfNt_HA0CS0Y_N0zayUAX8olMuv7odG2FiDLDQZIRBqbPQwBSArXfEJlQ.webp';
  final urls = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsCYOfQ3xrj9SDUjHcrk-BflYM3ZBgAtuI6g&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4wiJr4_MW2T6MNKwz_iF-fpjIgpdtlqHlWA&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwb-W2njjECsVAY6dTl980-Bifri6KcCooBQ&s',
  ];
  final imageDataSourceImpl = ImageDataSourceImpl();
  final imageRepositoryImpl = ImageRepositoryImpl(imageDataSourceImpl);

  await imageRepositoryImpl.saveImage(url, imagePath);
  await imageRepositoryImpl.saveImages(urls, imageDirectory);
}
