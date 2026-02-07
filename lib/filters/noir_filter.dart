import 'filter_base.dart';

/// Noir black and white filter with  high contrast
class NoirFilter extends PixelFilter {
  @override
  String get name => 'Noir';
  
  @override
  String get description => 'High contrast monochrome';
  
  @override
  int get targetWidth => 180;
  
  @override
  List<String>? get palette => [
    '#000000',
    '#777777',
    '#FFFFFF',
  ];
  
  @override
  int get colorCount => 3;
  
  @override
  bool get useMedianFilter => false;
  
  @override
  int get medianFilterSize => 0;
}
