import 'index.dart';

class CollectionChartDataListModel {
  List<CollectionChartData> collectionChartDataList;

  CollectionChartDataListModel({required this.collectionChartDataList});

  CollectionChartDataListModel.fromJson(Map<String, dynamic> json)
    : collectionChartDataList = (json['collectionChartDataList'] as List)
              .map((e) => CollectionChartData.fromJson(e as Map<String, dynamic>))
              .toList();

  Map<String, dynamic> toJson() => {
    'collectionChartDataList':
        collectionChartDataList.map((e) => e.toJson()).toList(),
  };
}
