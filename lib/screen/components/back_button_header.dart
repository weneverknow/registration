part of 'components.dart';

class BackButtonHeader extends StatelessWidget {
  const BackButtonHeader({this.onTap, Key? key}) : super(key: key);
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding, vertical: defaultPadding / 2),
      child: Row(
        children: [
          GestureDetector(onTap: onTap, child: Icon(Icons.arrow_back_rounded)),
          const SizedBox(width: defaultPadding / 2),
          TitleText(text: 'Create Account')
        ],
      ),
    );
  }
}
