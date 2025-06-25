T? asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  return null;
}

T safeCast<T>(dynamic value, {T? defaultValue}) {
  if (value == null) {
    return _getDefault<T>(defaultValue);
  }

  try {
    if (T == int) {
      return (value is int) ? value as T : int.tryParse(value.toString()) as T;
    } else if (T == double) {
      return (value is double)
          ? value as T
          : double.tryParse(value.toString()) as T;
    } else if (T == num) {
      if (value is num) return value as T;
      final parsed = num.tryParse(value.toString());
      return (parsed ?? _getDefault<T>(defaultValue)) as T;
    } else if (T == String) {
      return value.toString() as T;
    } else if (T == bool) {
      if (value is bool) return value as T;
      final str = value.toString().toLowerCase();
      if (str == 'true' || str == '1') return true as T;
      if (str == 'false' || str == '0') return false as T;
      return _getDefault<T>(defaultValue);
    } else {
      // Fallback for unknown type, cast directly
      return value as T;
    }
  } catch (_) {
    return _getDefault<T>(defaultValue);
  }
}

T _getDefault<T>(T? customDefault) {
  if (customDefault != null) return customDefault;

  if (T == int) return 0 as T;
  if (T == double) return 0.0 as T;
  if (T == num) return 0.0 as T; // 默认用 double 表示 num 的默认值
  if (T == String) return "" as T;
  if (T == bool) return true as T;

  throw Exception("Unsupported type for default value: $T");
}
