// ignore_for_file: library_private_types_in_public_api
import 'package:pos_animal/presentation_layer/src/components_packge.dart';
import 'package:pos_animal/presentation_layer/src/style_packge.dart';

class BottomNavAuth extends StatelessWidget {
  const BottomNavAuth({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);
  final String text;
  final void Function() press;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, deviceInfo) {
        return SizedBox(
          height: 110,
          child: Column(
            children: [
              CustomButton(
                width: deviceInfo.maxWidth * 0.85,
                height: 60,
                backgroundColor: ColorManager.kPrimary,
                text: text,
                press: press,
              ),
            ],
          ),
        );
      },
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 2'),
      ),
      body: const Center(
        child: Text('Screen 2'),
      ),
    );
  }
}

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 3'),
      ),
      body: const Center(
        child: Text('Screen 3'),
      ),
    );
  }
}

class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 4'),
      ),
      body: const Center(
        child: Text('Screen 4'),
      ),
    );
  }
}
