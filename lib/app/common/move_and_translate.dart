import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;

/// 调用 Google Translate API（通过 web 接口）
Future<String> translateToEnglish(String text) async {
  final url = Uri.parse(
    'https://translate.googleapis.com/translate_a/single?client=gtx&sl=zh-CN&tl=en&dt=t&q=${Uri.encodeComponent(text)}',
  );
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final result = json.decode(response.body);
    return (result[0][0][0] as String).replaceAll(' ', '_').toLowerCase();
  } else {
    throw Exception('翻译失败：${response.statusCode}');
  }
}

/// 获取 scale 文件夹（1x / 2x / 3x）
String getScale(String filename) {
  if (filename.contains('@2x')) return '2x';
  if (filename.contains('@3x')) return '3x';
  return '1x';
}

/// 获取 base 中文名
String getBaseName(String filename) {
  return filename
      .replaceAll('@2x', '')
      .replaceAll('@3x', '')
      .replaceAll('.png', '');
}

Future<void> main() async {
  final currentDir = Directory.current;
  final files = currentDir.listSync();

  final nameMap = <String, String>{}; // 中文 -> 英文缓存，避免重复翻译

  for (var entity in files) {
    if (entity is! File || !entity.path.endsWith('.png')) continue;

    final filename = p.basename(entity.path);
    final scale = getScale(filename);
    final baseChinese = getBaseName(filename);

    if (!nameMap.containsKey(baseChinese)) {
      try {
        final translated = await translateToEnglish(baseChinese);
        nameMap[baseChinese] = translated;
      } catch (e) {
        print('⚠️ 翻译失败：$baseChinese -> 跳过 $filename');
        continue;
      }
    }

    final baseEnglish = nameMap[baseChinese]!;
    final newFileName = '$baseEnglish.png';
    final targetDir = Directory(p.join(currentDir.path, scale));
    if (!targetDir.existsSync()) {
      targetDir.createSync(recursive: true);
    }

    final targetPath = p.join(targetDir.path, newFileName);
    await entity.copy(targetPath);
    print('✅ $filename ➜ $scale/$newFileName');
  }

  print('\n🎉 所有图片已处理完成！');
}
