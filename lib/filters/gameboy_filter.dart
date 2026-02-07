import 'filter_base.dart';

/// GameBoy-style filter with classic olive green palette
class GameBoyFilter extends PixelFilter {
  @override
  String get name => 'GameBoy';
  
  @override
  String get description => 'Classic handheld console look';
  
  @override
  int get targetWidth => 120;
  
  @override
  List<String>? get palette => [
    '#0f380f',
    '#306230',
    '#8bac0f',
    '#9bbc0f',
  ];
  
  @override
  int get colorCount => 4;
  
  @override
  bool get useMedianFilter => false;
  
  @override
  int get medianFilterSize => 0;
}
