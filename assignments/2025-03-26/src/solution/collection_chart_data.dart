// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'collection.dart';
import 'sale_price.dart';

class CollectionChartData {
  String collectionName;
  List<SalePrice>? collectionSalePrice;

  CollectionChartData({
    required this.collectionName,
    required this.collectionSalePrice,
  });

  Map<String, dynamic> toJson() {
    if (collectionSalePrice == null) {
      return {'collectionName': collectionName};
    }
    return {
      'collectionName': collectionName,
      'collectionSalePrice':
          collectionSalePrice?.map((e) => e.toJson()).toList(),
    };
  }

  CollectionChartData.fromJson(Map<String, dynamic> json)
    : collectionName = json['collectionName'] ?? '',
      collectionSalePrice =
          (json['collectionSalePrice'] as List<dynamic>?)
              ?.map((e) => SalePrice.fromJson(e))
              .toList();
  @override
  String toString() {
    // TODO: implement toString
    return '{collectionName: $collectionName, collectionSalePrice: ${collectionSalePrice?.map((e) => e.toString())}}';
  }
}

void main() {
  final file = File('assignments/2025-03-26/src/solution/chart_data.json');

  String contents = file.readAsStringSync();
  //print(jsonDecode(contents)['collectionChartDataList']);

  Map<String, dynamic> dataFromJson = jsonDecode(contents);

  Collection collection = Collection.fromJson(dataFromJson);

  final collectionChartDataList = collection.collectionChartDataList;

  print(collectionChartDataList.where((e) => e.collectionSalePrice == null));
}
