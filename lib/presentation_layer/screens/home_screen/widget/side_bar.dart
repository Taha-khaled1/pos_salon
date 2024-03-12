// import 'package:pos_animal/presentation_layer/screen/home_screen/controller/home_controller.dart';
// import 'package:pos_animal/presentation_layer/screen/home_screen/home_screen.dart';
// import 'package:pos_animal/presentation_layer/screen/home_screen/models/IconTitleVerticals.dart';
//
// import '../../../src/account_url.dart';
//
// class SideBar extends StatefulWidget {
//   const SideBar({
//     super.key,
//   });
//
//   @override
//   State<SideBar> createState() => _SideBarState();
// }
//
// class _SideBarState extends State<SideBar> {
//   int slectindex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.center,
//       width: 130,
//       height: double.infinity,
//       padding: const EdgeInsets.only(
//         top: 111,
//         left: 15,
//         right: 15,
//         bottom: 24,
//       ),
//       decoration: BoxDecoration(
//         gradient: RadialGradient(
//           center: Alignment(-0.04, 0.92),
//           radius: 0,
//           colors: [Color(0xFF12798A), Color(0xFF0E5D6A)],
//         ),
//       ),
//       child: ListView.builder(
//         itemCount: IconTitleVerticals.length,
//         itemBuilder: (BuildContext context, int index) {
//           return GestureDetector(
//             onTap: () {
//               setState(() {
//                 slectindex = index;
//                 PAGEID = index;
//                 HomeController controller = Get.put(HomeController());
//                 controller.manualUpdate();
//               });
//             },
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 8),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 color: slectindex == index
//                     ? Color(0xffBB9121)
//                     : Colors.transparent,
//               ),
//               child: IconTitleVerticals[index],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
