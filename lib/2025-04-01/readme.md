# 과제 1. Repository 작성 연습 1

https://jsonplaceholder.typicode.com/comments

의 정보를 데이터소스로 하는 CommentRepository 를 작성하시오.

MockCommentDatasourceImpl

CommentRepositoryImpl

작성할 메소드

- Future<List<Comment>> getComments(int postId)

---

# 과제 2. Repository 작성 연습 2

https://jsonplaceholder.typicode.com/photos

의 정보를 데이터소스로 하는 PhotoRepository 를 작성하시오.

작성할 메소드

- Future<List<Photo>> getPhotos(int albumId)

---

# 과제 3. Repository 작성 연습 3

https://jsonplaceholder.typicode.com/todos

의 정보를 데이터소스로 하는 TodoRepository 를 작성하시오.

작성할 메소드

- Future<List<Todo>> getTodos()
- Future<List<Todo>> getCompletedTodos()

---

# 과제 4. Repository 작성 연습 4

https://jsonplaceholder.typicode.com/users

의 정보를 데이터 소스로 하는 UserRepository 를 작성하시오.

작성할 메소드

- Future<List<User>> getUsers()
- Future<List<User>> getUsersTop10ByUserName()

---

# 과제 5. Repository 작성 연습 5

https://jsonplaceholder.typicode.com/albums

의 정보를 데이터소스로 하는 AlbumRepository 를 작성하시오.

작성할 메소드

- List<Album> getAlbums({int? limit})
    - limit 을 지정하지 않으면 모든 데이터를
    - limit 을 지정하면 limit 갯수만큼