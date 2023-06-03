import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

class minePage extends StatefulWidget {
  final String data;

  minePage({Key? key, required this.data}) : super(key: key);

  @override
  _minePageState createState() => _minePageState();
}

class _minePageState extends State<minePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
      ),
      body: Container(
        color: Colors.red,
        child: InkWell(
          child: Text('传输过的文字是-----${widget.data}'),
          onTap: () {
            // BoostNavigator.instance.pop();
            BoostChannel.instance
                .sendEventToNative("eventToNative", {"key1": "value1"});
          },
        ),
      ),
    );
  }
}
