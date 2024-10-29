class Nullable<T> {
  T _val;

  Nullable(this._val);

  T get value => _val;
}
