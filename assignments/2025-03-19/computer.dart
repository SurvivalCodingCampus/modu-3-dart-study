import 'package:modu_3_dart_study/2025-03-19/tangibleAsset.dart';

class Computer extends TangibleAsset{
  String markerName;

  Computer({required super.name, required super.price, required super.color, required this.markerName, required super.weight});
}