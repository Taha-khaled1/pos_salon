import 'package:flutter/material.dart';

class IconTitleHorizatal extends StatelessWidget {
  const IconTitleHorizatal({
    super.key,
    required this.image,
    required this.title,
    // this.Iscolor = false,
  });
  final String image, title;
  // final bool Iscolor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
            color: Color(0xFF828487),
            height: 25,
          ),
          SizedBox(
            width: 57,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF828487),
                fontSize: 13,
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
