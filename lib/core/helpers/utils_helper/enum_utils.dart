class EnumUtil {
  static String? parseToString(enumItem) {
    if (enumItem == null) return null;
    var x = enumItem.toString().split('.')[1];
    return x;
  }

  static T? fromStringEnum<T>(Iterable<T?>? values, String stringType) {
    return values!.firstWhere((f) =>
        f.toString().substring(f.toString().indexOf('.') + 1).toString() ==
        stringType);
  }
}
