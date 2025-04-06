import '../data_source/mask_data_source.dart';
import '../data_source/mask_data_source_impl.dart';
import '../mapper/mask_mapper.dart';
import '../model/mask.dart';
import 'mask_repository.dart';

class MaskRepositoryImpl implements MaskRepository {
  final MaskDataSource _maskDataSource;

  MaskRepositoryImpl({required MaskDataSource maskDataSource})
      : _maskDataSource = maskDataSource;

  @override
  Future<Mask> getMask(String name) async {
    try {
      final masks = await getMasks();
      return masks.firstWhere((e) => e.name == name);
    } catch (e) {
      throw Exception('해당 이름에 맞는 마스크 데이터가 없습니다');
    }
  }

  @override
  Future<List<Mask>> getMasks() async {
    final maskDtos = await _maskDataSource.getMasks();

    return maskDtos
        .map((dto) => dto.toDomain()) // MaskMapper에서 정의한 확장 함수
        // ignore: unnecessary_null_comparison
        .where((mask) => mask != null)
        .cast<Mask>()
        .toList();
  }
}

void main() async {
  final repository = MaskRepositoryImpl(
    maskDataSource: MaskDataSourceImpl(),
  );

  final result = await repository.getMasks();
  for (var mask in result) {
    print(mask.prettyPrint());
  }
}