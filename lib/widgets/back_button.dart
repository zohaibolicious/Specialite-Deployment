import 'package:flutter/material.dart';

class BackButtonM extends StatelessWidget {
  const BackButtonM({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Container(
        height: 40,
        width: 40,
        child: Material(
          color: Colors.white,
          // shape: CircleBorder(),
          borderRadius: BorderRadius.circular(50),
          elevation: 0,
          child: InkWell(
            onTap: () => Navigator.of(context).pop(),
            borderRadius: BorderRadius.circular(50),
            child: Center(
              child: Icon(
                Icons.keyboard_backspace,
                color: Colors.black,
              ),
            ),
            // child: IconButton(
            //   // splashRadius: 50.0,
            //   icon: const Icon(
            //     Icons.keyboard_backspace,
            //     color: Colors.black,
            //   ),
            //   // color: Colors.black,
            //   onPressed: () {
            //     Navigator.of(context).pop();
            //   },
            // ),
          ),
        ),
      ),
    );
  }
}
