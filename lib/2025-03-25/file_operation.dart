abstract interface class FileOperation {
  void copy(String sourcePath, String targetPath);

  void write(String targetPath, [String contents = '']);

  String read(String targetPath);

  Future<String> readAsync(String targetPath);

  Future<List<String>> readAsLinesAsync(String targetPath);
}
