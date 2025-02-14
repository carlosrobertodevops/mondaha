import 'package:collection/collection.dart';

enum ToastType {
  info,
  warning,
  error,
  success,
}

enum ToastStyle {
  fillColored,
  flat,
  minimal,
  flatColored,
}

enum ToastPosition {
  topLeft,
  topCenter,
  topRight,
  centerLeft,
  center,
  centerRight,
  bottomLeft,
  bottomCenter,
  bottomRight,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (ToastType):
      return ToastType.values.deserialize(value) as T?;
    case (ToastStyle):
      return ToastStyle.values.deserialize(value) as T?;
    case (ToastPosition):
      return ToastPosition.values.deserialize(value) as T?;
    default:
      return null;
  }
}
