import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Input extends StatefulWidget {
  @override
  _InputState createState() => _InputState();
}

int val = 0;

class _InputState extends State<Input> {
  @override
  var opinionText = 'could be better'.toUpperCase();
  Color opinionColor = Colors.red;
  IconData emoji = FontAwesomeIcons.sadTear;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
        leading: Icon(
          FontAwesomeIcons.arrowLeft,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.more_vert,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Please rate our service!',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Color(0xFF1D1E33),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    opinionText,
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: opinionColor,
                    ),
                  ),
                  Icon(
                    emoji,
                    color: opinionColor,
                    size: 100,
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: val.toDouble(),
                      max: 5.0,
                      min: 0.0,
                      onChanged: (double newValue) {
                        setState(() {
                          val = newValue.round();

                          //Brain
                          if (val >= 000 && val <= 1.0) {
                            Icon(
                              emoji = FontAwesomeIcons.sadTear,
                            );
                            opinionColor = Colors.red;
                            opinionText = 'could be better'.toUpperCase();
                          } else if (val >= 1.1 && val <= 2.0) {
                            Icon(
                              emoji = FontAwesomeIcons.frown,
                            );
                            opinionText = 'below average'.toUpperCase();
                            opinionColor = Colors.yellow;
                          } else if (val >= 2.1 && val <= 3.0) {
                            Icon(
                              emoji = FontAwesomeIcons.meh,
                            );
                            opinionText = 'normal'.toUpperCase();
                            opinionColor = Colors.amber;
                          } else if (val >= 3.1 && val <= 4.0) {
                            Icon(
                              FontAwesomeIcons.smile,
                            );
                            opinionText = 'good'.toUpperCase();
                            opinionColor = Colors.green;
                          } else {
                            Icon(
                              emoji = FontAwesomeIcons.laugh,
                            );
                            opinionText = 'excellent'.toUpperCase();
                            opinionColor = Color(0xFF24D876);
                          }
                        });
                      },
                    ),
                  ),
                  Text(
                    'Your Rating: $val',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      color: Color(0xFF8D8E98),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Color(0xFF8D8E98),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Color(0xFF090C22),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
