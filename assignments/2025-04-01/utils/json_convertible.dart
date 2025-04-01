abstract interface class JsonConvertible<T, ID> {
  Map<String, dynamic> toJson();
  T fromJson(Map<String, dynamic> json);
  ID get filterKey;
}
