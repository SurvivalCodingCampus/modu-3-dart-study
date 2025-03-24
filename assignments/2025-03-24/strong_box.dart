class StrongBox<T> {
  T _product;

  StrongBox(this._product);

  T get product => _product;
  set product(T value){
    _product = value;
  }
}
