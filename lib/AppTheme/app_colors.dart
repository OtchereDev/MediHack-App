// ignore_for_file: constant_identifier_names

part of AppConfig;

class AppColors {
  static final Color primaryColor = HexColor.fromHex("0D6726");
  static const PRIMARYCOLOR = Color(0xffF22B1F);
  static const SECONDARYCOLOR = Color(0xff84993B);
  static const INACTIVEBUTTONS = Color(0XFFB2E5CD);
  static const WHITE = Colors.white;
  static const BLACK = Colors.black;
  static const ASHDEEP = Colors.grey;
  static const ASH = Color(0xffCCCCCC);
  static const DIFCOLOR = Color(0xff94A3B8);
  static const LIGHTASH = Color(0XFFEFEFF4);
  static const BACKREDCOLOR = Color(0XFFE9D8D8);
  static const ICONCOLOR = Color(0xFFE6A9A9);
  static const LIGHTGREEN = Color(0xffD8F2E6);
// ignore: use_full_hex_values_for_flutter_colors
  static const HEADINGCOLOR = Color(0xff1E293B);
  static const LIGHTRED = Color(0xFFE6A9A9);
  static const RED = Color(0xffC44646);
  static const SPLASHSCREEN_COLOR = Color(0xfff5f5e9);
  static const GREENCOLOR = Color(0xff15803D);
  static const GREY = Color(0xff4F4F4F);
  static const YELLOW = Color(0xffEDA435);
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
