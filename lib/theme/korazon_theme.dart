import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Korazon brand colors (from your screenshot)
class KorazonColors {
  static const pink0   = Color(0xFFFF3AB0); // 0%
  static const pink25  = Color(0xFFFF177C); // 25%
  static const pink50  = Color(0xFFDF107C); // 50%
  static const purple  = Color(0xFF98007C); // 100%
}

/// Build a linear gradient with your exact stops.
/// You can change the angle (in degrees) to rotate the gradient.
class KorazonGradient {
  static LinearGradient build({
    double angleDeg = 0, // 0 = left→right, 90 = top→bottom, 45 = TL→BR
    double opacity = 1.0,
  }) {
    final a = _alignmentFromAngle(angleDeg);
    return LinearGradient(
      begin: a.$1,
      end: a.$2,
      colors: [
        KorazonColors.pink0.withOpacity(opacity),
        KorazonColors.pink25.withOpacity(opacity),
        KorazonColors.pink50.withOpacity(opacity),
        KorazonColors.purple.withOpacity(opacity),
      ],
      stops: const [0.0, 0.25, 0.50, 1.0],
    );
  }

  /// Convenience: full-screen background decoration
  static BoxDecoration background({
    double angleDeg = 45, // nice diagonal by default
    double opacity = 1.0,
  }) {
    return BoxDecoration(gradient: build(angleDeg: angleDeg, opacity: opacity));
  }

  /// Convert an angle in degrees to begin/end Alignments for LinearGradient
  static (Alignment, Alignment) _alignmentFromAngle(double deg) {
    // Map angle to unit circle; 0° = left→right
    final rad = deg * math.pi / 180.0;
    final dx = math.cos(rad);
    final dy = math.sin(rad);
    // begin is opposite direction of end
    final begin = Alignment(-dx, -dy);
    final end   = Alignment(dx, dy);
    return (begin, end);
  }
}
