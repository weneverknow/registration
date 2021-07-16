part of 'widgets.dart';

class CustomListBox extends StatelessWidget {
  const CustomListBox(
      {this.height = 50,
      required this.topText,
      required this.text,
      this.onTap,
      this.listChild,
      this.topMargin = 0,
      Key? key})
      : super(key: key);
  final double? height;
  final String topText;
  final String text;
  final Function()? onTap;
  final Widget? listChild;
  final double? topMargin;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: height,
            margin: EdgeInsets.only(top: topMargin!),
            padding: EdgeInsets.symmetric(
              horizontal: defaultPadding,
            ),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CaptionText(
                      text: topText,
                      color: Colors.grey[600],
                    ),
                    SubTitleText(
                      text: text,
                      color: Colors.black,
                    )
                  ],
                ),
                GestureDetector(
                    onTap: onTap ?? () {},
                    child: Icon(Icons.arrow_drop_down_rounded,
                        size: 50, color: Colors.grey[600]))
              ],
            ),
          ),
        ),
        listChild ?? const SizedBox.shrink()
      ],
    );
  }
}
