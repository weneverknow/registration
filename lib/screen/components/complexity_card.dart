part of 'components.dart';

class ComplexityCard extends StatelessWidget {
  const ComplexityCard(
      {required this.signText,
      required this.description,
      this.checked = false,
      Key? key})
      : super(key: key);
  final String signText;
  final String description;
  final bool checked;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        checked
            ? Container(
                width: 32,
                height: 32,
                margin: EdgeInsets.symmetric(vertical: 3),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFF2A8D2A)),
                alignment: Alignment.center,
                child: Icon(Icons.check),
              )
            : Text(
                signText,
                style: bigTitleText.copyWith(color: Colors.white, fontSize: 35),
              ),
        CaptionText(
          text: description,
        )
      ],
    );
  }
}
