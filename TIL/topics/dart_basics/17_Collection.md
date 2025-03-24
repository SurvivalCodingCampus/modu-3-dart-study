

# Collection



### SortedBy()

```dart
// List<Cleric> ascendingSortedByNameClericList = clericList.sorted((a, b) => 
//     a.name.compareTo(b.name));

// 오름차순 정렬 짧게 이렇게도 가능
List<Cleric> ascendingSortedByNameClericList = clericList.sortedBy((cleric) => 
    cleric.name);
```

