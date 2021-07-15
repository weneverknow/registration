part of 'pages.dart';

class FourthPage extends StatefulWidget {
  const FourthPage({Key? key}) : super(key: key);

  @override
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  Color circleColor = Colors.white;
  @override
  void initState() {
    super.initState();
    changeColor(() {
      setState(() {
        circleColor = Color(0xFF2A8D2A);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            HeaderContainer(
              children: [
                CircleNumber(
                  text: '1',
                  color: Color(0xFF2A8D2A),
                ),
                CircleNumber(
                  text: '2',
                  color: Color(0xFF2A8D2A),
                ),
                CircleNumber(
                  text: '3',
                  color: Color(0xFF2A8D2A),
                ),
                CircleNumber(
                  text: '4',
                  color: circleColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
