파일을 읽을때 최상단이 List인지 확인해보기

```json
{
  "count": 2323,
  "stores": [
    {
      "name": "OO약국",
      "addr": "서울시 ..."
    },
    {
      "name": "XX약국",
      "addr": "부산시 ..."
    }
  ]
}
```

이러한 api일때 우리가 필요한 데이터는 stores라는 List안에 존재하기때문에
List<dynamic> 형태로 받아온다.

1. api받아서 <List<Map<String, dynamic>>> 처리할때

```dart
class MovieDataSourceImpl implements MovieDataSource {
  @override
  Future<List<Map<String, dynamic>>> getUpcomingMovies() async {
    final response = await http.get(
      Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1',
      ),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      final List<dynamic> results = jsonData['results'];
      return List<Map<String, dynamic>>.from(results);
    } else {
      throw Exception('Failed to load upcoming movies');
    }
  }
}

```

2. 이미지 링크로 받아오기

```dart
class ImageDataSourceImpl implements ImageDataSource {
  @override
  Future<Uint8List> fetchImage(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('이미지를 못불러옴');
    }
  }

  @override
  Future<void> saveImage(Uint8List bytes, String path) async {
    final File file = File(path);
    await file.writeAsBytes(bytes);
  }
}

```

3. 파일을 읽고 DTO로 받아올때

```dart
class PhotoDataSourceImpl implements PhotoDataSource {
  final String filePath = 'assignments/2025-04-04/json/photo.json';

  @override
  Future<List<PhotoDto>> getPhotoDataDto() async {
    try {
      final file = File(filePath);
      final fileString = await file.readAsString();
      final List<dynamic> fileJson = jsonDecode(fileString);
      return fileJson.map((e) => PhotoDto.fromJson(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
```

4. API주소를 읽고 이미지 받기

```dart
class StoreDataSourceImpl implements StoreDataSource {
  final urlApi =
      'https://gist.githubusercontent.com/junsuk5/2b34223fb2368d2bf44c85082745649a/raw/00cb276cb4f4f9573d868e88382f6f7f6759df31/mask_store.json';

  @override
  Future<List<StoreDto>> getStoresData() async {
    final response = await http.get(Uri.parse(urlApi));
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      final List<dynamic> jsonList = json['stores'];
      return jsonList.map((e) => StoreDto.fromJson(e)).toList();
    } else {
      throw Exception('주소 파싱 오류');
    }
  }
}
```

5. List형식으로 불러오기

```dart
class PhotoDataSourceImpl implements PhotoDataSource {
  final String path = 'lib/PR2025-04-01/photos/assets/photos.json';

  Future<List<Photo>> getPhotos() async {
    final file = File(path);
    //json 파일 읽어오기
    final jsonContents = await file.readAsString();
    //List<Map<String, dynamic>> 으로 변환
    List<dynamic> listContents = jsonDecode(jsonContents);
    // 위의 컨텐츠를 Photo 리스트 형식으로 변환
    return listContents.map((e) => Photo.fromJson(e)).toList();
  }
}

```