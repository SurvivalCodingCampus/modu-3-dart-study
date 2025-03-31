void main() {
  dynamic data = [
    {
      'A': [1, 2, 3],
      'B': [4, 5, 6],
    },
    {
      'C': [7, 8, 9],
      'D': [10, 11, 12],
    },
  ];

  try {
    print(data.cast<Map<String, List<int>>>());
  } on TypeError {
    print('Error');
  }
}
