// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:toastification/toastification.dart';

class ToastListener extends StatefulWidget {
  const ToastListener({
    super.key,
    this.width,
    this.height,
    required this.notificationData,
  });
  final double? width;
  final double? height;
  final NotificationStruct notificationData;

  @override
  State<ToastListener> createState() => _ToastListenerState();
}

class _ToastListenerState extends State<ToastListener> {
  // Convert ToastType to ToastificationType
  ToastificationType _getToastificationType(ToastType type) {
    switch (type) {
      case ToastType.info:
        return ToastificationType.info;
      case ToastType.warning:
        return ToastificationType.warning;
      case ToastType.error:
        return ToastificationType.error;
      case ToastType.success:
        return ToastificationType.success;
    }
  }

  // Get appropriate icon based on toast type
  Widget _getToastIcon(ToastType type) {
    switch (type) {
      case ToastType.info:
        return const Icon(
          Icons.info_rounded,
          color: Colors.white,
          size: 24,
        );
      case ToastType.warning:
        return const Icon(
          Icons.warning_rounded,
          color: Colors.white,
          size: 24,
        );
      case ToastType.error:
        return const Icon(
          Icons.error_rounded,
          color: Colors.white,
          size: 24,
        );
      case ToastType.success:
        return const Icon(
          Icons.check_circle_rounded,
          color: Colors.white,
          size: 24,
        );
    }
  }

  // Convert ToastStyle to ToastificationStyle
  ToastificationStyle _getToastificationStyle(ToastStyle style) {
    switch (style) {
      case ToastStyle.fillColored:
        return ToastificationStyle.fillColored;
      case ToastStyle.flat:
        return ToastificationStyle.flat;
      case ToastStyle.minimal:
        return ToastificationStyle.minimal;
      case ToastStyle.flatColored:
        return ToastificationStyle.flatColored;
    }
  }

  // Convert ToastPosition to Alignment
  Alignment _getAlignment(ToastPosition position) {
    switch (position) {
      case ToastPosition.topLeft:
        return Alignment.topLeft;
      case ToastPosition.topCenter:
        return Alignment.topCenter;
      case ToastPosition.topRight:
        return Alignment.topRight;
      case ToastPosition.centerLeft:
        return Alignment.centerLeft;
      case ToastPosition.center:
        return Alignment.center;
      case ToastPosition.centerRight:
        return Alignment.centerRight;
      case ToastPosition.bottomLeft:
        return Alignment.bottomLeft;
      case ToastPosition.bottomCenter:
        return Alignment.bottomCenter;
      case ToastPosition.bottomRight:
        return Alignment.bottomRight;
    }
  }

  void _showToast() {
    final notification = widget.notificationData;
    final title =
        notification.title.isEmpty ? "Notification" : notification.title;

    toastification.show(
      context: context,
      type: _getToastificationType(notification.type),
      style: _getToastificationStyle(notification.style),
      title: Text(title),
      description: Text(notification.description),
      alignment: _getAlignment(notification.position),
      autoCloseDuration: const Duration(seconds: 4),
      animationBuilder: (
        context,
        animation,
        alignment,
        child,
      ) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
      icon: _getToastIcon(notification.type),
      borderRadius: BorderRadius.circular(12.0),
      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 10,
          offset: Offset(0, 4),
        ),
      ],
      showProgressBar: notification.progressBar,
      dragToClose: notification.dragToClose,
      pauseOnHover: notification.pauseOnHover,
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ToastListener oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (FFAppState().notificationDT.display) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        _showToast();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
