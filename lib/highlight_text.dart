import 'package:flutter/material.dart';

class HighlightText extends StatelessWidget {
  /// 文本内容
  final String text;

  /// 文本样式
  final TextStyle? style;

  /// 文本对齐方式
  final TextAlign textAlign;

  /// 高亮文本内容
  final String highlightText;

  /// 高亮文本样式
  final TextStyle? highlightStyle;

  /// 高亮文本颜色
  final Color highlightColor;

  /// 高亮线高度
  final double highlightHeight;

  /// 高亮线偏移量(相对于文本的底边距)
  final double highlightOffset;

  const HighlightText({
    super.key,
    required this.text,
    this.style,
    this.textAlign = TextAlign.left,
    required this.highlightText,
    this.highlightStyle,
    required this.highlightColor,
    this.highlightHeight = 6.0,
    this.highlightOffset = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (!text.contains(highlightText)) {
        assert(false, "The $text does not contain the $highlightText");
      }
      // 使用TextPainter来计算文本的大小
      final texts = text.split(highlightText);
      TextSpan textSpan = TextSpan(
        style: style,
        children: [
          TextSpan(text: texts.first),
          TextSpan(
            text: highlightText,
            style: highlightStyle,
          ),
          TextSpan(text: texts.last),
        ],
      );
      TextPainter textPainter = TextPainter(
        text: textSpan,
        textAlign: textAlign,
        textDirection: TextDirection.ltr,
        maxLines: null,
      );

      // 计算文本的布局
      textPainter.layout(maxWidth: constraints.maxWidth);

      // 获取文本的实际宽高
      double textWidth = textPainter.width;
      double textHeight = textPainter.height;

      return RepaintBoundary(
        child: CustomPaint(
          size: Size(textWidth, textHeight),
          painter: HighlightTextPainter(
            text: text,
            textPainter: textPainter,
            highlightText: highlightText,
            highlightColor: highlightColor,
            highlightHeight: highlightHeight,
            highlightOffset: highlightOffset,
          ),
        ),
      );
    });
  }
}

class HighlightTextPainter extends CustomPainter {
  final String text;
  final TextPainter textPainter;
  final String highlightText;
  final Color highlightColor;
  final double highlightHeight;
  final double highlightOffset;

  HighlightTextPainter({
    required this.text,
    required this.highlightText,
    required this.highlightColor,
    required this.textPainter,
    required this.highlightHeight,
    required this.highlightOffset,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // 找到高亮文本的位置并绘制下划线
    int start = text.indexOf(highlightText);
    List<TextBox> boxes = textPainter.getBoxesForSelection(
      TextSelection(
        baseOffset: start,
        extentOffset: start + highlightText.length,
      ),
    );
    for (final box in boxes) {
      // 计算高亮部分文本的坐标
      double startX = box.left;
      double endX = box.right;
      double y = box.bottom - highlightOffset;

      final highlightPaint = Paint()
        ..color = highlightColor
        ..strokeWidth = highlightHeight;

      // 绘制下划线
      canvas.drawLine(
        Offset(startX, y),
        Offset(endX, y),
        highlightPaint,
      );
    }

    // 绘制整个文本
    textPainter.paint(canvas, Offset.zero);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
