import 'collection_data.dart';

class CollectionChartDataList {
  List<CollectionData> collectionChartDataList;

  CollectionChartDataList({required this.collectionChartDataList});

  // 직렬화
  Map<String, dynamic> toJson() {
    return {
      'collectionChartDataList':
          collectionChartDataList.map((e) => e.toJson()).toList(),
    };
  }

  // 역직렬화
  CollectionChartDataList.fromJson(Map<String, dynamic> json)
    : collectionChartDataList =
          (json['collectionChartDataList']
                  as List?) // Nullable collectionChartDataList가 빈배열일수도..
              ?.map((e) => CollectionData.fromJson(e)) //null-safe
              .toList() ??
          [];

  @override
  String toString() =>
      'CollectionChartDataList(collectionChartDataList: $collectionChartDataList)';
}
