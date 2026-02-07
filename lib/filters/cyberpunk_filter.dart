import 'filter_base.dart';

/// Cyberpunk filter with neon pinks and blues
class CyberpunkFilter extends PixelFilter {
  @override
  String get name => 'Cyberpunk';
  
  @override
  String get description => 'Neon pinks and blues';
  
  @override
  int get targetWidth => 160;
  
  @override
  List<String>? get palette => [
    '#000b1e',
    '#ff0055',
    '#00ff9f',
    '#00b8ff',
    '#fdee00',
  ];
  
  @override
  int get colorCount => 5;
  
  @override
  bool get useMedianFilter => false;
  
  @override
  int get medianFilterSize => 0;
}
