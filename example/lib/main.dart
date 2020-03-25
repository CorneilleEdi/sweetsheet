import 'package:flutter/material.dart';
import 'package:sweetsheet/sweetsheet.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SweetSheet',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'SweetSheet'),
    );
  }
}

class HomePage extends StatefulWidget {
  final String title;

  HomePage({this.title});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final SweetSheet _sweetSheet = SweetSheet();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            LargeButton(
              context: context,
              text: 'Success sheet',
              onClick: () {
                _sweetSheet.show(
                  context: context,
                  title: "Lorem Ipsum",
                  description:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. no you condimentum finibus ut ut lorem. Ut pellentesque mauris ut arcu rutrum, at tincidunt arcu tincidunt ',
                  type: SweetSheetType.SUCCESS,
                  positive: SweetSheetAction(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    title: 'CANCEL',
                  ),
                );
              },
            ),
            LargeButton(
              context: context,
              text: 'Danger sheet with icon',
              onClick: () {
                _sweetSheet.show(
                  context: context,
                  title: "Delete this post?",
                  description: "This action will permanently delete this post.",
                  type: SweetSheetType.DANGER,
                  icon: Icons.delete,
                  positive: SweetSheetAction(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    title: 'CANCEL',
                  ),
                  negative: SweetSheetAction(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    title: 'DELETE',
                  ),
                );
              },
            ),
            LargeButton(
              context: context,
              text: 'Warning sheet with icon',
              onClick: () {
                _sweetSheet.show(
                  context: context,
                  title: "Attention",
                  description:
                  'Your app is not connected to internet actually, please turn on Wifi/Celullar data.',
                  type: SweetSheetType.WARNING,
                  icon: Icons.portable_wifi_off,
                  positive: SweetSheetAction(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    title: 'CANCEL',
                  ),
                  negative: SweetSheetAction(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    title: 'OPEN SETTING',
                    icon: Icon(Icons.open_in_new),
                  ),
                );
              },
            ),
            LargeButton(
              context: context,
              text: "Nice sheet with icon",
              onClick: () {
                _sweetSheet.show(
                  context: context,
                  title: "Connect your watch",
                  description:
                  'To import your health data, you have to connect your smartwatch fist.',
                  type: SweetSheetType.NICE,
                  icon: Icons.watch,
                  positive: SweetSheetAction(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    title: 'CANCEL',
                  ),
                  negative: SweetSheetAction(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    title: 'CONNECT',
                    icon: Icon(Icons.open_in_new),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


class LargeButton extends StatelessWidget {
  final BuildContext context;
  final String text;
  final VoidCallback onClick;

  const LargeButton(
      {Key key, @required this.context, @required this.text, this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: FlatButton(
        padding: const EdgeInsets.all(30),
        color: Colors.black45,
        onPressed: onClick,
        child: Container(
          width: double.infinity,
          child: Text(
            text,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}