import 'package:flutter/cupertino.dart';

class CustomPageRoute extends PageRouteBuilder {
  final Widget child;

  CustomPageRoute({required this.child})
      : super(
            transitionDuration: Duration(milliseconds: 400),
            transitionsBuilder: (context, animation, animationTime, child) {
              return SlideTransition(
                position: Tween<Offset>(begin: Offset(-1, 0), end: Offset.zero)
                    .animate(animation),
                child: child,
              );
            },
            pageBuilder: (context, animation, secondaryAnimation) => child);

  // @override
  // Widget buildTrnsation(BuildContext context, Animation<double> animation,
  //         Animation<double> secondaryAnimation, Widget child) =>

}
