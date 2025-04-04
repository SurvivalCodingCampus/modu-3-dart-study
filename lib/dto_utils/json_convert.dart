abstract interface class JsonConvert<T, E> {
  Map<String, dynamic> toJson();
  T fromJson(Map<String, dynamic> json);
  E toEntity();
}
