part of 'widgets.dart';

class AnimatedAlert extends StatefulWidget {
  const AnimatedAlert(
      {this.anyError = false, required this.errorText, Key? key})
      : super(key: key);
  final bool? anyError;
  final String errorText;

  @override
  _AnimatedAlertState createState() => _AnimatedAlertState();
}

class _AnimatedAlertState extends State<AnimatedAlert>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  //late Animation<double> _translateAnimation;
  //late Animation<double> _opacityAnimation;
  late AlertAnimation animation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animation = AlertAnimation(_controller);
    // _translateAnimation = Tween<double>(begin: 1, end: 0).animate(
    //     CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));
    // _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
    super.initState();
  }

  void showError() {
    if (widget.anyError!) {
      _controller.forward().then((value) => hideAlert());
    }
  }

  void hideAlert() async {
    await Future.delayed(Duration(milliseconds: 1500));
    _controller.reverse();
  }

  @override
  void didUpdateWidget(AnimatedAlert oldWidget) {
    super.didUpdateWidget(oldWidget);
    showError();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation.translateAnimation,
      builder: (context, child) => Transform(
        transform: Matrix4.translationValues(
            0, (136 * animation.translateAnimation.value), 0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Opacity(
            opacity: animation.opacityAnimation.value,
            child: Container(
              height: 50,
              width: ScreenSize.screenWidth(context),
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                  bottom: defaultPadding,
                  left: defaultPadding,
                  right: defaultPadding),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.red[300]),
              child: SubTitleText(text: widget.errorText),
            ),
          ),
        ),
      ),
    );
  }
}
