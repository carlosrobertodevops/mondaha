import 'package:collection/collection.dart';
import "package:community_testing_ryusdv/backend/schema/enums/enums.dart"
    as community_testing_ryusdv_enums
    hide FFEnumExtensions, FFEnumListExtensions;

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (community_testing_ryusdv_enums.ToastType):
      return community_testing_ryusdv_enums.ToastType.values.deserialize(value)
          as T?;
    case (community_testing_ryusdv_enums.ToastStyle):
      return community_testing_ryusdv_enums.ToastStyle.values.deserialize(value)
          as T?;
    case (community_testing_ryusdv_enums.ToastPosition):
      return community_testing_ryusdv_enums.ToastPosition.values
          .deserialize(value) as T?;
    default:
      return null;
  }
}
