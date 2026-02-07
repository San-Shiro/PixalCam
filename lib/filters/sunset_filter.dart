import 'filter_base.dart';

/// Sunset filter with warm vintage colors
class SunsetFilter extends PixelFilter {
  @override
  String get name => 'Sunset';
  
  @override
  String get description => 'Warm vintage tones';
  
  @override
  int get targetWidth => 150;
  
  @override
  List<String>? get palette => [
    '#2d1b33',
    '#7b3445',
    '#f06449',
    '#ede89a',
    '#63ace5',
  ];
  
  @override
  int get colorCount => 5;
  
  @override
  bool get useMedianFilter => false;
  
  @override
  int get medianFilterSize => 0;
}
