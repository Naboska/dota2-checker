import 'package:dota2checker/widgets/situation_widget/situation_widget.dart';
import 'package:flutter/material.dart';

class HeroBackgroundWidget extends StatefulWidget {
  const HeroBackgroundWidget({Key? key}) : super(key: key);

  @override
  _HeroBackgroundState createState() => _HeroBackgroundState();
}

class _HeroBackgroundState extends State<HeroBackgroundWidget> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SizedBox(
          height: 400,
            child: Image.asset('assets/abaddon.gif')
        ),
        const Text('privet')
      ],
    );
  }
}
