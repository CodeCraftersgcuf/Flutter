// import 'package:flutter/material.dart';
// import 'package:first_app/gradient_container.dart';

// void main() {
//   runApp(
//    const  MaterialApp(
//       home: Scaffold(
//         body: GradientContainer(Colors.black26, Colors.white54),
//       ),
//     ),
//   );
// }

import 'package:first_app/gradient_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(Colors.black, Colors.white),
      )
    ),
  );
}
