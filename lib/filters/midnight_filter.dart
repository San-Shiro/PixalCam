import 'filter_base.dart';

/// Midnight filter with dark bluish tones
class MidnightFilter extends PixelFilter {
  @override
  String get name => 'Midnight';
  
  @override
  String get description => 'Dark bluish tones';
  
  @override
  int get targetWidth => 160;
  
  @override
  List<String>? get palette => [
    '#0d1117',
    '#1f2937',
    '#374151',
    '#6b7280',
  ];
  
  @override
  int get colorCount => 4;
  
  @override
  bool get useMedianFilter => true;
  
  @override
  int get medianFilterSize => 7;
}
