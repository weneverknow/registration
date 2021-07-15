part of 'widgets.dart';

class DefaultInputField extends StatelessWidget {
  const DefaultInputField(
      {this.prefixIcon,
      this.hintText,
      this.obscureText,
      this.height,
      this.color,
      this.suffixIcon,
      this.controller,
      this.onChanged,
      Key? key})
      : super(key: key);
  final Widget? prefixIcon;
  final String? hintText;
  final bool? obscureText;
  final double? height;
  final Color? color;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: color ?? greyColor),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
          horizontal: defaultPadding / 2, vertical: defaultPadding / 4),
      child: TextField(
        controller: controller,
        obscureText: obscureText ?? false,
        onChanged: onChanged,
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(color: Colors.black),
        decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none),
      ),
    );
  }
}
