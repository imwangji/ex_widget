import 'package:ex_widget/components/button/ex_button.dart';
import 'package:ex_widget/components/card/ex_card.dart';
import 'package:ex_widget/components/cta_card/ex_cta_card.dart';
import 'package:ex_widget/components/divider/ex_divider.dart';
import 'package:ex_widget/components/input_item/ex_input_item.dart';
import 'package:ex_widget/components/item/ex_item.dart';
import 'package:ex_widget/components/input_box/ex_input_box.dart';
import 'package:ex_widget/components/search/ex_search_page.dart';
import 'package:ex_widget/components/section_header/ex_section_header.dart';
import 'package:ex_widget/components/simple_card/simple_card.dart';
import 'package:ex_widget/components/avatar_with_badge/ex_avatar_with_badge.dart';
import 'package:ex_widget/components/info_card/ex_info_card_a.dart';
import 'package:ex_widget/extensions/text.extension.dart';
import 'package:ex_widget/themes/ex_default_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: EXWidgetDefaultLightThemeData,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> componentList = [];

  @override
  void initState() {
    super.initState();
    componentList = [
      EXCard(
        padding: EdgeInsets.zero,
        child: EXItem(
          label: "学校",
          contentText: "请选择",
        ),
      ),
      EXSearchPage(
        state: EXSearchPageState.showSuggestion,
        suggestionItemBuilder: (p0, p1, index) => Text("搜索建议").color(Colors.black),
        suggestionCount: 3,
      ),
      EXInfoCardA(items: [
        EXInfoCardAItem(label: "队伍", value: "1"),
        EXInfoCardAItem(label: "打卡", value: "12"),
        EXInfoCardAItem(label: "被关注", value: "2780"),
      ]),
      ExAvatarWithBadge(
        badge: Icon(Icons.abc),
        onTap: () {},
        avatar: AssetImage("assets/images/avatar.jpeg"),
      ),
      EXInputBox(
        label: "姓名",
        hintText: "请输入",
        controller: TextEditingController(),
      ),
      EXSectionHeader(
        title: "队伍广场",
        action: EXButton(
          text: "创建",
          size: EXSize.small,
          exButtonType: EXButtonType.stroke,
          onPressed: () {},
        ),
      ),
      SimpleCard(
        title: "创建一个自己的队伍创建一个自己的队伍",
        action: CircleAvatar(backgroundColor: Colors.black),
        footer: Row(
          children: [
            const Text("如果你没有发现合适的队伍，你可以在这里创建一个").color(Colors.black54),
          ],
        ),
        onTap: () {
          print("simple_card");
        },
      ),
      EXCTACard(
        title: "创建一个自己的队伍创建一个自己的队伍",
        buttonText: "创建",
        footer: Row(
          children: [
            const Text("如果你没有发现合适的队伍，你可以在这里创建一个").color(Colors.black54),
          ],
        ),
        onTap: () {},
      ),
      EXDivider(),
      EXButton(
        text: "hello",
        onPressed: () {},
      ),
      EXDivider(),
      EXButton(
        text: "hello",
        size: EXSize.small,
        onPressed: () {},
      ),
      EXDivider(),
      EXButton(
        text: "hello",
        isLoading: true,
        isBlock: false,
        size: EXSize.mini,
        onPressed: () {},
      ),
      EXDivider(),
      EXCard(
        child: Text("123"),
      ),
      EXDivider(),
      EXInputItem(
        prefix: Icon(
          CupertinoIcons.add_circled,
          size: 22,
        ),
        label: "标题",
        hintText: "请输入",
      ),
      EXDivider(),
      EXItem(
        prefix: Icon(
          CupertinoIcons.add_circled,
          size: 22,
        ),
        label: "标题",
        contentText: "内容",
        suffix: Icon(
          CupertinoIcons.add_circled,
          size: 22,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.all(16),
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView.separated(itemBuilder: (context, index) => componentList.elementAt(index), separatorBuilder: (context, index) => EXDivider(), itemCount: componentList.length),
      ),
    );
  }
}
