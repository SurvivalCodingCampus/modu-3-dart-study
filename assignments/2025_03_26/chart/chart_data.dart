import 'collection_chart_data_list.dart';

class ChartData {
  List<CollectionChartDataList> collectionChartDataList;

  ChartData({required this.collectionChartDataList});

  Map<String, dynamic> toJson() {
    return {'collcetionCartDataList': collectionChartDataList};
  }

  ChartData.fromJson(Map<String, dynamic> json)
    : collectionChartDataList =
          (json['collectionChartDataList'] as List)
              .map(
                (e) =>
                    CollectionChartDataList.fromJson(e as Map<String, dynamic>),
              )
              .toList();

  @override
  String toString() {
    return 'collectionCartDataList : $collectionChartDataList';
  }
}
