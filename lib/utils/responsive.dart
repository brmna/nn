import 'package:flutter/material.dart';

class Responsive {
  final BuildContext context;
  late final double _width;
  late final double _height;
  late final double _shortestSide;

  Responsive(this.context) {
    final size = MediaQuery.of(context).size;
    _width = size.width;
    _height = size.height;
    _shortestSide = size.shortestSide;
  }

  // Breakpoints
  bool get isMobile => _shortestSide < 600;
  bool get isTablet => _shortestSide >= 600 && _shortestSide < 900;
  bool get isDesktop => _shortestSide >= 900;

  // Ancho de la tarjeta de formulario
  double get cardWidth {
    if (isDesktop) return 480;
    if (isTablet) return _width * 0.6;
    return double.infinity;
  }

  // Padding horizontal de la pantalla
  double get screenPadding {
    if (isDesktop) return _width * 0.25;
    if (isTablet) return _width * 0.15;
    return 24.0;
  }

  // Padding vertical
  double get verticalPadding {
    if (isDesktop) return _height * 0.06;
    if (isTablet) return 40.0;
    return 32.0;
  }

  // Tamaño del logo
  double get logoSize {
    if (isDesktop) return 70;
    if (isTablet) return 62;
    return 56;
  }

  // Fuente del título del form
  double get formTitleSize {
    if (isDesktop) return 24;
    if (isTablet) return 22;
    return 20;
  }

  // Fuente del nombre de la app
  double get appNameSize {
    if (isDesktop) return 30;
    if (isTablet) return 27;
    return 24;
  }

  // Espaciado interno de la tarjeta
  double get cardPadding {
    if (isDesktop) return 36;
    if (isTablet) return 30;
    return 24;
  }

  // Gap entre campos
  double get fieldGap {
    if (isTablet || isDesktop) return 18;
    return 16;
  }

  // Altura del botón
  double get buttonHeight {
    if (isTablet || isDesktop) return 54;
    return 50;
  }

  double get width => _width;
  double get height => _height;
}
