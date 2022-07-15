class Get {
  Get._();
  static Get i = Get._();

  final Map<String, dynamic> _data = {};

  String _getKey(Type t, String? tag) {
    if (tag != null) {
      return "${t.toString()}$tag";
    }

    return t.toString();
  }

  put<T>(dynamic dependency, {String? tag}) {
    final String key = _getKey(T, tag);
    _data[key] = dependency;
  }

  T find<T>({String? tag}) {
    final String key = _getKey(T, tag);

    if (!_data.containsKey(key)) {
      throw AssertionError("$key not fount, make sure call put firts");
    }
    return _data[key];
  }
}
