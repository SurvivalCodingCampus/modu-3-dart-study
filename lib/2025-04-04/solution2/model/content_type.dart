enum ContentType { article, image, video, unknown }

ContentType contentTypeFromString(String? typeStr) {
  if (typeStr == null) return ContentType.unknown;
  return ContentType.values.firstWhere(
    (e) => e.name == typeStr.toLowerCase(),
    orElse: () => ContentType.unknown,
  );
}
