import 'dart:async';

import 'package:flutter/material.dart';

///this is used to ensure if a user has not used the app for a certain time
///and force to log in again
class SessionTimeoutListener extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final VoidCallback onTimeOut;

  const SessionTimeoutListener({
    super.key,
    required this.child,
    required this.duration,
    required this.onTimeOut,
  });

  @override
  State<SessionTimeoutListener> createState() => _SessionTimeoutListenerState();
}

class _SessionTimeoutListenerState extends State<SessionTimeoutListener> {
  Timer? _timer;

  _startTimer() {
    if (_timer != null) {
      _timer?.cancel();
      _timer = null;
    }
    _timer = Timer(widget.duration, () {
      widget.onTimeOut();
    });
  }

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer?.cancel();
      _timer = null;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
        behavior: HitTestBehavior.translucent,
        onPointerDown: (_) {
          _startTimer();
        },
        child: widget.child);
  }
}
