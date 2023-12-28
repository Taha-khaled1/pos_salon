import 'package:pos_animal/presentation_layer/screen/home_screen/controller/home_controller.dart';
import 'package:pos_animal/presentation_layer/src/account_url.dart';

class ServiceWidget extends StatelessWidget {
  const ServiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return _.load
          ? Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Services",
                      style: MangeStyles().getBoldStyle(
                        color: ColorManager.black,
                        fontSize: FontSize.s20,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 670,
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: 20,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: 219,
                        height: 250,
                        padding: const EdgeInsets.only(
                            top: 12, left: 8, right: 8, bottom: 16),
                        decoration: ShapeDecoration(
                          color: Color(0xFFF5F5F5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 203,
                              height: 158,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 203,
                                    height: 158,
                                    decoration: ShapeDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          _.response['data'][index]['image'],
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),
                            Container(
                              width: double.infinity,
                              height: 52,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      _.response['data'][index]['title'],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF18181B),
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        // height: 0.09,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      '\$ ${_.response['data'][index]['price']}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF0E5D6A),
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        // height: 0.09,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                // SizedBox(
                //   height: 800,
                //   width: 670,
                //   child: SingleChildScrollView(
                //     child: Wrap(
                //       direction: Axis.horizontal,
                //       children: [
                //         for (int i = 0; i < _.response["data"].length; i++)
                //           Container(
                //             width: 219,
                //             height: 250,
                //             padding: const EdgeInsets.only(
                //                 top: 12, left: 8, right: 8, bottom: 16),
                //             decoration: ShapeDecoration(
                //               color: Color(0xFFF5F5F5),
                //               shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(16),
                //               ),
                //             ),
                //             child: Column(
                //               mainAxisSize: MainAxisSize.min,
                //               mainAxisAlignment: MainAxisAlignment.start,
                //               crossAxisAlignment: CrossAxisAlignment.center,
                //               children: [
                //                 Container(
                //                   width: 203,
                //                   height: 158,
                //                   child: Row(
                //                     mainAxisSize: MainAxisSize.min,
                //                     mainAxisAlignment: MainAxisAlignment.center,
                //                     crossAxisAlignment:
                //                         CrossAxisAlignment.center,
                //                     children: [
                //                       Container(
                //                         width: 203,
                //                         height: 158,
                //                         decoration: ShapeDecoration(
                //                           image: DecorationImage(
                //                             image: AssetImage(
                //                                 "assets/images/Placeholder.png"),
                //                             fit: BoxFit.fill,
                //                           ),
                //                           shape: RoundedRectangleBorder(
                //                             borderRadius:
                //                                 BorderRadius.circular(12),
                //                           ),
                //                         ),
                //                       ),
                //                     ],
                //                   ),
                //                 ),
                //                 const SizedBox(height: 12),
                //                 Container(
                //                   width: double.infinity,
                //                   height: 52,
                //                   padding:
                //                       const EdgeInsets.symmetric(horizontal: 8),
                //                   child: Column(
                //                     mainAxisSize: MainAxisSize.min,
                //                     mainAxisAlignment: MainAxisAlignment.start,
                //                     crossAxisAlignment:
                //                         CrossAxisAlignment.start,
                //                     children: [
                //                       SizedBox(
                //                         width: double.infinity,
                //                         child: Text(
                //                           'Hair cut',
                //                           textAlign: TextAlign.center,
                //                           style: TextStyle(
                //                             color: Color(0xFF18181B),
                //                             fontSize: 16,
                //                             fontFamily: 'Poppins',
                //                             fontWeight: FontWeight.w600,
                //                             // height: 0.09,
                //                           ),
                //                         ),
                //                       ),
                //                       const SizedBox(height: 4),
                //                       SizedBox(
                //                         width: double.infinity,
                //                         child: Text(
                //                           '\$ 25.12',
                //                           textAlign: TextAlign.center,
                //                           style: TextStyle(
                //                             color: Color(0xFF0E5D6A),
                //                             fontSize: 16,
                //                             fontFamily: 'Poppins',
                //                             fontWeight: FontWeight.w600,
                //                             // height: 0.09,
                //                           ),
                //                         ),
                //                       ),
                //                     ],
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           ),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            );
    });
  }
}
