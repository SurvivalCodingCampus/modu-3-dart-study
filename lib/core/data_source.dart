abstract interface class DataSource<DTO> {
  Future<List<DTO>> fetch();
}
