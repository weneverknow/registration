part of 'widgets.dart';

class ExpandedListBox extends StatelessWidget {
  const ExpandedListBox(
      {required this.options, this.onPress, required this.child, Key? key})
      : super(key: key);
  final List<dynamic> options;
  final Function()? onPress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
      constraints: BoxConstraints(minHeight: 100, maxHeight: 200),
      child: child,
    );
  }
}
