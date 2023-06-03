import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:fluttertoast/fluttertoast.dart';

class homePage extends StatefulWidget {
  homePage({Key? key}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> with PageVisibilityObserver {
  String testStr = '123213213';

  @override
  void onBackground() {
    super.onBackground();
    print("LifecycleTestPage - onBackground");
    testStr = '99999999999';
    setState(() {
      testStr = 'LifecycleTestPage - onBackground';
    });
  }

  @override
  void onForeground() {
    super.onForeground();
    print("LifecycleTestPage - onForeground");
  }

  @override
  void onPageHide() {
    super.onPageHide();
    print("LifecycleTestPage - onPageHide");
    setState(() {
      testStr = 'LifecycleTestPage - onPageHide';
    });
  }

  @override
  void onPageShow() {
    super.onPageShow();
    print("LifecycleTestPage - onPageShow");
    setState(() {
      testStr = 'LifecycleTestPage - onPageShow';
    });
  }

  @override
  void initState() {
    super.initState();

    ///请在didChangeDependencies中注册而不是initState中
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    ///注册监听器
    PageVisibilityBinding.instance
        .addObserver(this, ModalRoute.of(context) as Route);
  }

  @override
  void dispose() {
    ///移除监听器
    PageVisibilityBinding.instance.removeObserver(this);
    super.dispose();
  }

  /* ///声明一个用来存回调的对象
  VoidCallback removeListener = BoostChannel.instance
      .addEventListener("eventToFlutter", (key, arguments) {
    String data = arguments['data'];

    Fluttertoast.showToast(msg: "我接收到了来自 native 的数据----$data");

    return;
  });*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: Container(
        color: Colors.red,
        child: InkWell(
          child: Text('当前的状态是 $testStr'),
          onTap: () {
            // BoostNavigator.instance
            //     .push('minePage', arguments: {'data': '我累个去'});
            //  AlertDialog(title: Text('234234234'));
            Fluttertoast.showToast(msg: "我接收到了来自 native 的数据");
          },
        ),
      ),
    );
  }
}
