import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: const Column(
          children: [
            HighlightText(
              text:
                  '本节将主要介绍一下移动开发技术的进化历程，了解一下 Flutter 技术出现的背景。笔者认为，了解一门新技术出现的背景是非常重要的，因为只有了解之前是什么样的，才能理解为什么会是现在这样。',
              style: TextStyle(color: Colors.black, fontSize: 24),
              highlightText: 'Flutter',
              highlightColor: Colors.yellow,
              highlightHeight: 10,
            ),
            SizedBox(height: 20),
            HighlightText(
              text:
              'Flutter 是 Google 推出并开源的移动应用开发框架，主打跨平台、高保真、高性能。开发者可以通过 Dart 语言开发 App，一套代码同时运行在 iOS 和 Android平台。 Flutter 提供了丰富的组件、接口，开发者可以很快地为 Flutter 添加 Native（即原生开发，指基于平台原生语言来开发应用，flutter可以和平台原生语言混合开发） 扩展。下面我们整体介绍一下 Flutter 技术的主要特点。',
              style: TextStyle(color: Colors.black, fontSize: 20),
              highlightText: '一套代码同时运行',
              highlightColor: Colors.green,
            ),
            SizedBox(height: 20),
            HighlightText(
              text:
              '由于Flutter会同时构建Android和IOS两个平台的发布包，所以Flutter同时依赖Android SDK和iOS SDK，在安装Flutter时也需要安装相应平台的构建工具和SDK。下面我们分别介绍一下Windows和macOS下的环境搭建。',
              style: TextStyle(color: Colors.black, fontSize: 16),
              highlightText: 'Windows',
              highlightColor: Colors.black,
              highlightHeight: 2,
              highlightOffset: 8,
            ),
          ],
        ),
      ),
    );
  }
}
