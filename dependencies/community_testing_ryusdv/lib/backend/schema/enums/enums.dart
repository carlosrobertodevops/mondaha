import 'package:collection/collection.dart';
import 'package:ff_commons/flutter_flow/enums.dart';
export 'package:ff_commons/flutter_flow/enums.dart';

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
