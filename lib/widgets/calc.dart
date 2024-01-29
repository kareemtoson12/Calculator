import 'package:calc/colors/colors.dart';

import 'package:flutter/material.dart';

class Calc extends StatefulWidget {
  const Calc(
      {super.key,
      this.darkmode = false,
      required this.child,
      required this.borderRadius,
      required this.padding});
  final bool darkmode;
  final Widget child;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;

  @override
  State<Calc> createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  bool isPressed = false;
  void _onpointerup(PointerUpEvent event) {
    setState(() {
      isPressed = false;
    });
  }

  void _onpointerdown(PointerDownEvent event) {
    setState(() {
      isPressed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool darkmode = widget.darkmode;
    return Listener(
      onPointerDown: _onpointerdown,
      onPointerUp: _onpointerup,
      child: Container(
        padding: widget.padding,
        decoration: BoxDecoration(
            color: darkmode ? colordark : colorwhite,
            borderRadius: widget.borderRadius,
            boxShadow: isPressed
                ? null
                : [
                    BoxShadow(
                        color: darkmode
                            ? Colors.black45
                            : Colors.blueGrey.shade100,
                        offset: const Offset(4, 4),
                        blurRadius: 15,
                        spreadRadius: 1),
                    BoxShadow(
                      color: darkmode ? Colors.blueGrey.shade700 : Colors.white,
                      offset: const Offset(-4, -4),
                      blurRadius: 15,
                      spreadRadius: 1,
                    )
                  ]),
        child: widget.child,
      ),
    );
  }
}
