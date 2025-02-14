// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationStruct extends BaseStruct {
  NotificationStruct({
    String? title,
    String? description,
    ToastStyle? style,
    ToastPosition? position,
    ToastType? type,
    bool? progressBar,
    bool? dragToClose,
    bool? pauseOnHover,
    bool? display,
  })  : _title = title,
        _description = description,
        _style = style,
        _position = position,
        _type = type,
        _progressBar = progressBar,
        _dragToClose = dragToClose,
        _pauseOnHover = pauseOnHover,
        _display = display;

  // "title" field.
  String? _title;
  String get title => _title ?? 'This is a test';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? 'This is just a test';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "style" field.
  ToastStyle? _style;
  ToastStyle get style => _style ?? ToastStyle.fillColored;
  set style(ToastStyle? val) => _style = val;

  bool hasStyle() => _style != null;

  // "position" field.
  ToastPosition? _position;
  ToastPosition get position => _position ?? ToastPosition.topCenter;
  set position(ToastPosition? val) => _position = val;

  bool hasPosition() => _position != null;

  // "type" field.
  ToastType? _type;
  ToastType get type => _type ?? ToastType.info;
  set type(ToastType? val) => _type = val;

  bool hasType() => _type != null;

  // "progressBar" field.
  bool? _progressBar;
  bool get progressBar => _progressBar ?? false;
  set progressBar(bool? val) => _progressBar = val;

  bool hasProgressBar() => _progressBar != null;

  // "dragToClose" field.
  bool? _dragToClose;
  bool get dragToClose => _dragToClose ?? false;
  set dragToClose(bool? val) => _dragToClose = val;

  bool hasDragToClose() => _dragToClose != null;

  // "pauseOnHover" field.
  bool? _pauseOnHover;
  bool get pauseOnHover => _pauseOnHover ?? false;
  set pauseOnHover(bool? val) => _pauseOnHover = val;

  bool hasPauseOnHover() => _pauseOnHover != null;

  // "display" field.
  bool? _display;
  bool get display => _display ?? false;
  set display(bool? val) => _display = val;

  bool hasDisplay() => _display != null;

  static NotificationStruct fromMap(Map<String, dynamic> data) =>
      NotificationStruct(
        title: data['title'] as String?,
        description: data['description'] as String?,
        style: data['style'] is ToastStyle
            ? data['style']
            : deserializeEnum<ToastStyle>(data['style']),
        position: data['position'] is ToastPosition
            ? data['position']
            : deserializeEnum<ToastPosition>(data['position']),
        type: data['type'] is ToastType
            ? data['type']
            : deserializeEnum<ToastType>(data['type']),
        progressBar: data['progressBar'] as bool?,
        dragToClose: data['dragToClose'] as bool?,
        pauseOnHover: data['pauseOnHover'] as bool?,
        display: data['display'] as bool?,
      );

  static NotificationStruct? maybeFromMap(dynamic data) => data is Map
      ? NotificationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'description': _description,
        'style': _style?.serialize(),
        'position': _position?.serialize(),
        'type': _type?.serialize(),
        'progressBar': _progressBar,
        'dragToClose': _dragToClose,
        'pauseOnHover': _pauseOnHover,
        'display': _display,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'style': serializeParam(
          _style,
          ParamType.Enum,
        ),
        'position': serializeParam(
          _position,
          ParamType.Enum,
        ),
        'type': serializeParam(
          _type,
          ParamType.Enum,
        ),
        'progressBar': serializeParam(
          _progressBar,
          ParamType.bool,
        ),
        'dragToClose': serializeParam(
          _dragToClose,
          ParamType.bool,
        ),
        'pauseOnHover': serializeParam(
          _pauseOnHover,
          ParamType.bool,
        ),
        'display': serializeParam(
          _display,
          ParamType.bool,
        ),
      }.withoutNulls;

  static NotificationStruct fromSerializableMap(Map<String, dynamic> data) =>
      NotificationStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        style: deserializeParam<ToastStyle>(
          data['style'],
          ParamType.Enum,
          false,
        ),
        position: deserializeParam<ToastPosition>(
          data['position'],
          ParamType.Enum,
          false,
        ),
        type: deserializeParam<ToastType>(
          data['type'],
          ParamType.Enum,
          false,
        ),
        progressBar: deserializeParam(
          data['progressBar'],
          ParamType.bool,
          false,
        ),
        dragToClose: deserializeParam(
          data['dragToClose'],
          ParamType.bool,
          false,
        ),
        pauseOnHover: deserializeParam(
          data['pauseOnHover'],
          ParamType.bool,
          false,
        ),
        display: deserializeParam(
          data['display'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'NotificationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NotificationStruct &&
        title == other.title &&
        description == other.description &&
        style == other.style &&
        position == other.position &&
        type == other.type &&
        progressBar == other.progressBar &&
        dragToClose == other.dragToClose &&
        pauseOnHover == other.pauseOnHover &&
        display == other.display;
  }

  @override
  int get hashCode => const ListEquality().hash([
        title,
        description,
        style,
        position,
        type,
        progressBar,
        dragToClose,
        pauseOnHover,
        display
      ]);
}

NotificationStruct createNotificationStruct({
  String? title,
  String? description,
  ToastStyle? style,
  ToastPosition? position,
  ToastType? type,
  bool? progressBar,
  bool? dragToClose,
  bool? pauseOnHover,
  bool? display,
}) =>
    NotificationStruct(
      title: title,
      description: description,
      style: style,
      position: position,
      type: type,
      progressBar: progressBar,
      dragToClose: dragToClose,
      pauseOnHover: pauseOnHover,
      display: display,
    );
