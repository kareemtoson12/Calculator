import 'package:calc/widgets/calc.dart';
import 'package:flutter/material.dart';
import 'package:calc/colors/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

bool darkmode = true;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkmode ? colordark : colorwhite,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      setState(() {
                        darkmode ? darkmode = false : darkmode = true;
                      });
                    },
                    child: _switchmode()),
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '6.010',
                    style: TextStyle(
                        fontSize: 55,
                        fontWeight: FontWeight.bold,
                        color: darkmode ? Colors.white : Colors.red),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '=',
                      style: TextStyle(
                          fontSize: 35,
                          color: darkmode ? Colors.green : Colors.grey),
                    ),
                    Text(
                      '10+500*12',
                      style: TextStyle(
                          fontSize: 20,
                          color: darkmode ? Colors.green : Colors.grey),
                    )
                  ],
                ),
              ],
            )),
            // ignore: avoid_unnecessary_containers
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buttomOval(
                        title: 'Sin',
                      ),
                      _buttomOval(
                        title: 'Cos',
                      ),
                      _buttomOval(
                        title: 'Tan',
                      ),
                      _buttomOval(
                        title: '%',
                      ),
                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buttonRound(
                          title: 'C',
                          textColor: darkmode ? Colors.green : Colors.redAccent,
                        ),
                        _buttonRound(title: '('),
                        _buttonRound(title: ')'),
                        _buttonRound(
                          title: '/',
                          textColor: darkmode ? Colors.green : Colors.redAccent,
                        ),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buttonRound(title: '7'),
                        _buttonRound(title: '8'),
                        _buttonRound(title: '9'),
                        _buttonRound(
                          title: 'x',
                          textColor: darkmode ? Colors.green : Colors.redAccent,
                        ),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buttonRound(title: '4'),
                        _buttonRound(title: '5'),
                        _buttonRound(title: '6'),
                        _buttonRound(
                          title: '-',
                          textColor: darkmode ? Colors.green : Colors.redAccent,
                        ),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buttonRound(title: '1'),
                        _buttonRound(title: '2'),
                        _buttonRound(title: '3'),
                        _buttonRound(
                          title: '+',
                          textColor: darkmode ? Colors.green : Colors.redAccent,
                        ),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buttonRound(title: '0'),
                        _buttonRound(title: ','),
                        _buttonRound(
                          iccon: Icons.backspace,
                          iconcolor: darkmode ? Colors.green : Colors.redAccent,
                        ),
                        _buttonRound(
                          title: ' = ',
                          textColor: darkmode ? Colors.green : Colors.redAccent,
                        ),
                      ])
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget _buttonRound(
      {String? title,
      // ignore: non_constant_identifier_names
      Paddinng = 10.0,
      IconData? iccon,
      Color? iconcolor,
      Color? textColor}) {
    return Padding(
      padding: const EdgeInsets.all(7.5),
      child: Calc(
        borderRadius: BorderRadius.circular(40),
        padding: EdgeInsets.all(Paddinng),
        darkmode: darkmode,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            width: Paddinng * 2,
            height: Paddinng * 2,
            child: Center(
              child: title != null
                  ? Text(
                      "$title",
                      style: TextStyle(
                          color: textColor ??
                              (darkmode ? Colors.white : Colors.black54),
                          fontSize: 20),
                    )
                  : Icon(iccon, color: iconcolor, size: 30),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttomOval({
    String? title,
    double padding = 17.0,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Calc(
        // ignore: sort_child_properties_last
        child: Text(
          '$title',
          style: TextStyle(
              color: darkmode ? Colors.white : Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
        borderRadius: BorderRadius.circular(50),
        padding:
            EdgeInsets.symmetric(horizontal: padding, vertical: padding / 2),
        darkmode: darkmode,
      ),
    );
  }

  Widget _switchmode() {
    return Calc(
      borderRadius: BorderRadius.circular(40),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      darkmode: darkmode,
      child: Container(
        width: 70,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Icon(
            Icons.wb_sunny,
            color: darkmode ? Colors.grey : Colors.redAccent,
          ),
          Icon(
            Icons.nightlight_round,
            color: darkmode ? Colors.green : Colors.grey,
          ),
        ]),
      ),
    );
  }
}
