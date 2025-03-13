void main() {
  Different obj1 = Different(10, 10);
  Different obj2 = Different(10, 10);

  // print(identical(obj1, obj2));

  Object o = "sss";
  var o1 = "sss";
  String s = "sss";
  print(s.length);
  print(s.runtimeType);

  // print(o.length);
  print(o1.length);
  print(o1.runtimeType);
  print(o.runtimeType);
}


class Different {
  Object x ;
  var y ;

  Different(this.x,
      this.y
      );

}

// class Different {
//   Object obj = 10;
//   obj = 'hello';
//
// }


