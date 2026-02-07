import 'filter_base.dart';

/// Retro filter with high dithering and adaptive colors
class RetroFilter extends PixelFilter {
  @override
  String get name => 'Retro';
  
  @override
  String get description => 'High dither with adaptive colors';
  
  @override
  int get targetWidth => 140;
  
  @override
  List<String>? get palette => null; // Adaptive
  
  @override
  int get colorCount => 6;
  
  @override
  bool get useMedianFilter => false;
  
  @override
  int get medianFilterSize => 0;
}
