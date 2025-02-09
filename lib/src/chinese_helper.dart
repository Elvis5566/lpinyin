import 'package:lpinyin/src/pinyin_resource.dart';

/// Chinese Helper.
class ChineseHelper {
  static const String chineseRegex = "[\\u4e00-\\u9fa5]";
  static final RegExp chineseRegexp = RegExp(chineseRegex);
  static final Map<String, String> zhHantMap =
      PinyinResource.getZhHantResource();
  static final Map<String, String> zhHansMap =
      PinyinResource.getZhHansResource();

  /// 判断某个字符是否为汉字
  /// @return 是汉字返回true，否则返回false
  static bool isChinese(String c) {
    return '〇' == c || chineseRegexp.hasMatch(c);
  }

  /// 判断某个字符是否为繁体字
  /// @param c 需要判断的字符
  /// @return 是繁体字返回true，否则返回false
  static bool isTraditionalChinese(String c) {
    return zhHantMap.containsKey(c);
  }

  /// 判断字符串中是否包含中文
  /// @param str 字符串
  /// @return 包含汉字返回true，否则返回false
  static bool containsChinese(String str) {
    for (int i = 0, len = str.length; i < len; i++) {
      if (isChinese(str[i])) {
        return true;
      }
    }
    return false;
  }

  /// 将单个繁体字转换为简体字
  /// @param c 需要转换的繁体字
  /// @return 转换后的简体字
  static String convertCharToSimplifiedChinese(String c) {
    String? simplifiedChinese = zhHantMap[c];
    return simplifiedChinese ?? c;
  }

  /// 将单个简体字转换为繁体字
  /// @param c 需要转换的简体字
  /// @return 转换后的繁字体
  static String convertCharToTraditionalChinese(String c) {
    String? tranditionalChinese = zhHansMap[c];
    return tranditionalChinese ?? c;
  }

  /// 将繁体字转换为简体字
  /// @param str 需要转换的繁体字
  /// @return 转换后的简体字
  static String convertToSimplifiedChinese(String str) {
    StringBuffer sb = StringBuffer();
    for (int i = 0, len = str.length; i < len; i++) {
      sb.write(convertCharToSimplifiedChinese(str[i]));
    }
    return sb.toString();
  }

  /// 将简体字转换为繁体字
  /// @param str 需要转换的简体字
  /// @return 转换后的繁字体
  static String convertToTraditionalChinese(String str) {
    StringBuffer sb = StringBuffer();
    for (int i = 0, len = str.length; i < len; i++) {
      sb.write(convertCharToTraditionalChinese(str[i]));
    }
    return sb.toString();
  }

  /// 添加繁体字字典
  static void addChineseDict(List<String> list) {
    zhHantMap.addAll(PinyinResource.getResource(list));
  }
}
