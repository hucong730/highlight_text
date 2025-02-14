# highlight_text

一个在flutter上的文本组件，支持以下划线的方式高亮显示内容，支持自定义下划线的高度和偏移量，支持高亮部分换行显示。

## Getting Started



1. HighlightText使用方式：

```dart

HighlightText(
  text:
      '本节将主要介绍一下移动开发技术的进化历程，了解一下 Flutter 技术出现的背景。笔者认为，了解一门新技术出现的背景是非常重要的，因为只有了解之前是什么样的，才能理解为什么会是现在这样。',
  style: TextStyle(color: Colors.black, fontSize: 24),
  highlightText: 'Flutter',
  highlightColor: Colors.yellow,
  highlightHeight: 10,
),

```