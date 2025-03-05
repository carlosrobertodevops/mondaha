import 'package:collection/collection.dart';
import "package:community_testing_ryusdv/backend/schema/enums/enums.dart"
    as community_testing_ryusdv_enums;
import 'package:ff_commons/flutter_flow/enums.dart';
export 'package:ff_commons/flutter_flow/enums.dart';

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
