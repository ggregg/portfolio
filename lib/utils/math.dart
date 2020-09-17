import 'dart:math';

typedef BetweenResult<T extends num> = T Function(T value);

BetweenResult<T> between<T extends num>(T minValue, T maxValue) {
  return (T value) => min(max(minValue, value), maxValue);
}
