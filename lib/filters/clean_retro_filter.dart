import 'filter_base.dart';

/// Clean Retro filter with median preprocessing and adaptive colors
class CleanRetroFilter extends PixelFilter {
  @override
  String get name => 'Clean Retro';
  
  @override
  String get description => 'Smoothed adaptive colors';
  
  @override
  int get targetWidth => 150;
  
  @override
  List<String>? get palette => null; // Adaptive
  
  @override
  int get colorCount => 7;
  
  @override
  bool get useMedianFilter => true;
  
  @override
  int get medianFilterSize => 7;
}
