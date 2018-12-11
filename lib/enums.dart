class MediaType {
  final _value;
  const MediaType._internal(this._value);
  toString() => 'Enum.$_value';

  static const IMAGE = const MediaType._internal('IMAGE');
  static const VIDEO = const MediaType._internal('VIDEO');
}
