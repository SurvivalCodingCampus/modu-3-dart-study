enum PhotoType {
  image,
  article,
  video,
  unknown;

  static PhotoType fromName(String name) => PhotoType.values.firstWhere(
    (type) => type.name == name,
    orElse: () => PhotoType.unknown,
  );
}
