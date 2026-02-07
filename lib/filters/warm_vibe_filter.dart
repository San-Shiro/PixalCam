import 'filter_base.dart';

/// Warm Vibe filter with reddish/peach tones
class WarmVibeFilter extends PixelFilter {
  @override
  String get name => 'Warm Vibe';
  
  @override
  String get description => 'Reddish and peach tones';
  
  @override
  int get targetWidth => 140;
  
  @override
  List<String>? get palette => [
    '#2a1d2e',
    '#563645',
    '#8f565b',
    '#c98d7a',
    '#f3c6aa',
  ];
  
  @override
  int get colorCount => 5;
  
  @override
  bool get useMedianFilter => true;
  
  @override
  int get medianFilterSize => 7;
}
