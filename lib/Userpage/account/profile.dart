// import 'package:flutter/material.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';

// class profilePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//  return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFF4C53A5),
//         leading: IconButton(
//             onPressed: () {}, icon: Icon(LineAwesomeIcons.angle_left)),
//         title:
//             Text("Profile", style: Theme.of(context).textTheme.headlineSmall),
//         actions: [
//           IconButton(
//               onPressed: () {}, icon:  Icon(LineAwesomeIcons.paint_brush)),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.all(50),
//           child: Column(
//             children: [
//               SizedBox(
//                 width: 120,
//                 height: 120,
//                 child: ClipRRect(
//                     borderRadius: BorderRadius.circular(200),
//                     child: Image.asset("assets/images/profile.jpeg")),
//               ),
//               const SizedBox(height: 20),
//               Text("Dimple Nandini",
//                   style: Theme.of(context).textTheme.headlineSmall),
//               Text("Nandimple1007@gmail.com",
//                   style: Theme.of(context).textTheme.bodyMedium),
//               SizedBox(height: 50),
//               SizedBox(
//                 width: 300,
//                 height: 50,
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   child: Text(
//                     "Edit Profile",
//                     style: TextStyle(color: Color.fromARGB(255, 217, 211, 228)),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color(0xFF4C53A5),
//                     side: BorderSide.none,
//                     shape: StadiumBorder(),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),
//               Divider(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
