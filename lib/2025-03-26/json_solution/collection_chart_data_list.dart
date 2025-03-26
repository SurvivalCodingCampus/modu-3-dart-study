import 'collection_chart_data.dart';

class CollectionChartDataResponse {
  final List<CollectionChartData> collectionChartDataList;

  const CollectionChartDataResponse({
    required this.collectionChartDataList,
  });

  CollectionChartDataResponse.fromJson(Map<String, dynamic> json)
      : collectionChartDataList = (json['collectionChartDataList'] as List)
      .map((e) => CollectionChartData.fromJson(e))
      .toList();

  Map<String, dynamic> toJson() => {
    'collectionChartDataList':
    collectionChartDataList.map((e) => e.toJson()).toList(),
  };
}