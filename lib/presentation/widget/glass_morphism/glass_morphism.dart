import 'dart:ui';

import 'package:flutter/material.dart';



class GlassMorphism extends StatelessWidget {
    final double blur;
    final double opacity;
    final Widget child;
    final BorderRadius? borderRadius;

    const GlassMorphism({
        super.key,
        required this.blur,
        required this.opacity,
        required this.child,
        this.borderRadius,
    });


    @override
    Widget build(BuildContext context) {
      return ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.zero,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: opacity),
                borderRadius: borderRadius,
            ),
            child: child,
        ),
      );
    }
}