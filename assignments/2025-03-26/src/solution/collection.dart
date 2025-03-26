// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'collection_chart_data.dart';

class Collection {
  List<CollectionChartData> collectionChartDataList;

  Collection({required this.collectionChartDataList});

  Map<String, dynamic> toJson() {
    return {
      "collectionChartDataList":
          collectionChartDataList.map((e) => e.toJson()).toList(),
    };
  }

  Collection.fromJson(Map<String, dynamic> json)
    : collectionChartDataList =
          (json['collectionChartDataList'] as List)
              .map((e) => CollectionChartData.fromJson(e))
              .toList();
}
