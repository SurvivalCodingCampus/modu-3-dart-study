import 'package:modu_3_dart_study/2025-03-21/book.dart';
import 'package:test/test.dart';

void main() {
    // 테스트를 위한 상수 정의
    const String defaultTitle = '죄와 벌';
    const String differentTitle = '생존코딩';

    const String defaultComment = '어떤 책일까?';
    const String updatedComment = '좋은책!';
    const String anotherComment = '대박!';

    final DateTime defaultPublishDate = DateTime(2024, 1, 1);
    final DateTime earlierPublishDate = DateTime(2020, 5, 10);
    final DateTime middlePublishDate = DateTime(2021, 3, 20);
    final DateTime latestPublishDate = DateTime(2022, 8, 15);
    final DateTime newPublishDate = DateTime(2025, 12, 25);


    group('[Book class 기능 테스트]', () {
        test('1. 제목과 출간 일이 동일 하면 같은지 테스트', () {
            Book book1 = Book(title: defaultTitle, comment: defaultComment, publishDate: defaultPublishDate);
            Book book2 = Book(title: defaultTitle, comment: anotherComment, publishDate: defaultPublishDate);

            print('${book1.toString()}');
            print('${book2.toString()}');

            expect(book1, equals(book2));
        });

        test('2. 다른 제목 또는 출간일일 경우 다르게 인식 되는지 테스트', () {
            Book book1 = Book(title: defaultTitle, comment: defaultComment, publishDate: defaultPublishDate);
            Book book2 = Book(title: differentTitle, comment: anotherComment, publishDate: defaultPublishDate);

            print('${book1.toString()}');
            print('${book2.toString()}');

            expect(book1, isNot(equals(book2)));
        });

        test('3. 출간일을 기준으로 최신순으로 내오게 정렬 테스트)', () {
            List<Book> books = [
                Book(title: 'Book A', comment: '첫번째 책', publishDate: earlierPublishDate),
                Book(title: 'Book B', comment: '세번째 책', publishDate: latestPublishDate),
                Book(title: 'Book C', comment: '두번째 책', publishDate: middlePublishDate),
            ];

            books.sort((a, b) => b.publishDate.compareTo(a.publishDate));

            for (Book book in books){
                print('${book.toString()}');
            }

            expect(books[0].title, 'Book B');
            expect(books[1].title, 'Book C');
            expect(books[2].title, 'Book A');
        });

        test('4. copyWith()를 사용 시 기존 객체를 변경 하지 않고 새로운 객체 생성', () {

            //원본 책 생성
            Book originalBook = Book(title: defaultTitle, comment: defaultComment, publishDate: defaultPublishDate);
            //comment 수정
            Book modifiedBook = originalBook.copyWith(comment: updatedComment);

            print('${originalBook.toString()}');
            print('${modifiedBook.toString()}');

            expect(modifiedBook.title, originalBook.title);
            expect(modifiedBook.comment, updatedComment);
            expect(modifiedBook.publishDate, originalBook.publishDate);
        });

        test('5. copyWith()를 사용해 제목, 출간일 변경 가능', () {

            Book originalBook = Book(title: defaultTitle, comment: defaultComment, publishDate: defaultPublishDate);
            Book modifiedBook = originalBook.copyWith(title: differentTitle, publishDate: newPublishDate);

            print('${originalBook.toString()}');
            print('${modifiedBook.toString()}');

            expect(modifiedBook.title, differentTitle);
            expect(modifiedBook.comment, originalBook.comment);
            expect(modifiedBook.publishDate, newPublishDate);
        });
    });
}
