# 디버깅 연습문제1
## 다음과 같은 데이터를 서버에서 받아서 처리해야 한다. 이 데이터를 담을 수 있는 클래스를 작성하시오.

```json
{
	"collectionChartDataList": [
		{
			"collectionName": "collectionName",
			"collectionSalePrice": null
		},
		{
			"collectionName": "collectionName",
			"collectionSalePrice": [
				{
					"price": 59.75,
					"cvtDatetime": "2023-03-26T08:08:35"
				},
				{
					"price": 60.00,
					"cvtDatetime": "2023-03-26T08:08:45"
				},
			]
		}
	]
}
```

복사용:

```dart
final String json = '''{
 "collectionChartDataList": [
   {
     "collectionName": "collectionName",
     "collectionSalePrice": null
   },
   {
     "collectionName": "collectionName",
     "collectionSalePrice": [
       {
         "price": 59.75,
         "cvtDatetime": "2023-03-26T08:08:35"
       },
       {
         "price": 60.00,
         "cvtDatetime": "2023-03-26T08:08:45"
       }
     ]
   }
 ]
}''';
```