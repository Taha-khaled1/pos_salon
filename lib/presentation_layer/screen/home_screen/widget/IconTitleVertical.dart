import 'package:flutter/material.dart';

class IconTitleVertical extends StatelessWidget {
  const IconTitleVertical({
    super.key,
    required this.image,
    required this.title,
    // required this.onTap,
    // this.Iscolor = false,
  });
  final String image, title;
  // final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
            color: Color(0xFFFFF9C9),
            height: 50,
          ),
          SizedBox(
            height: 25,
          ),
          SizedBox(
            width: 65,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFFFF9C9),
                fontSize: 15,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                // height: 0.10,
              ),
            ),
          )
        ],
      ),
    );
  }
}
