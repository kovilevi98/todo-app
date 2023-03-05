import 'dart:ui';
import 'package:flutter/material.dart';

class GlassMorphism extends StatelessWidget {
  final Widget child;
  final double start;
  final double end;
  final bool? dark;
  const GlassMorphism({
    Key? key,
    required this.child,
    required this.start,
    required this.end, this.dark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              width: 1.5,
              color: (dark == null) ? Colors.transparent : ((dark!) ?
              Colors.white.withOpacity(0.2) :
              Colors.black.withOpacity(0.2)),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}