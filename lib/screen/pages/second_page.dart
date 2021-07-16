part of 'pages.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late TextEditingController passwordController;
  Color circleColor = Colors.white;
  bool showPassword = false;
  bool isLowercase = false;
  bool isUppercase = false;
  bool isNumber = false;
  bool isChar = false;
  @override
  void initState() {
    passwordController = TextEditingController(text: '');
    changeColor(() {
      setState(() {
        circleColor = Color(0xFF2A8D2A);
      });
    });
    super.initState();
  }

  int strength = 0;
  List power = [];
  bool isError = false;

  void handlePasswordPower(bool type, String powerStr) {
    if (type) {
      if (!power.contains(powerStr)) {
        power.add(powerStr);
      }
    } else {
      power.remove(powerStr);
    }
  }

  void onChanged(String password) {
    final lowercaseReg = RegExp(r'[a-z]');
    final uppercaseReg = RegExp(r'[A-Z]');
    final numberReg = RegExp(r'[0-9]');
    final charReg = RegExp(r'[\(\)\[\]\{\}\^\$\.\?\*\+\|\=\+\-\@\#]');

    isLowercase = lowercaseReg.hasMatch(password);
    handlePasswordPower(isLowercase, 'lower');
    isUppercase = uppercaseReg.hasMatch(password);
    handlePasswordPower(isUppercase, 'upper');
    isNumber = numberReg.hasMatch(password);
    handlePasswordPower(isNumber, 'number');
    isChar = charReg.hasMatch(password);
    handlePasswordPower(isChar, 'char');
    isError = false;
    setState(() {});
  }

  void changeObscure(bool eye) {
    setState(() {
      showPassword = eye;
    });
  }

  void showError() {
    setState(() {
      isError = true;
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
                  color: circleColor,
                ),
                CircleNumber(text: '2'),
                CircleNumber(text: '3'),
                CircleNumber(text: '4'),
              ],
            ),
            BackButtonHeader(
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ContentWrapper(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  height: defaultPadding * 2,
                ),
                TitleText(text: 'Create Password'),
                const SizedBox(
                  height: defaultPadding / 4,
                ),
                SubTitleText(
                  text: 'Password will be use to login to account',
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                DefaultInputField(
                    onChanged: onChanged,
                    color: Colors.white,
                    height: 55,
                    controller: passwordController,
                    hintText: 'Create Password',
                    obscureText: !showPassword,
                    suffixIcon: !showPassword
                        ? GestureDetector(
                            onTap: () {
                              changeObscure(true);
                            },
                            child: Icon(Icons.remove_red_eye_outlined))
                        : GestureDetector(
                            onTap: () {
                              changeObscure(false);
                            },
                            child: Icon(Icons.remove_red_eye_rounded))),
                const SizedBox(
                  height: defaultPadding,
                ),
                Row(
                  children: [
                    SubTitleText(
                      text: 'Complexity:',
                    ),
                    const SizedBox(width: defaultPadding / 2),
                    Text(
                        power.length == 0
                            ? ''
                            : (power.length <= 2
                                ? 'Very Weak'
                                : (power.length == 3 ? 'Good' : 'Very Good')),
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(color: Colors.deepOrange[200]))
                  ],
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ComplexityCard(
                      signText: 'a',
                      description: 'Lowercase',
                      checked: isLowercase,
                    ),
                    ComplexityCard(
                        signText: 'A',
                        description: 'Uppercase',
                        checked: isUppercase),
                    ComplexityCard(
                        checked: isNumber,
                        signText: '123',
                        description: 'Number'),
                    ComplexityCard(
                        checked: isChar,
                        signText: '9+',
                        description: 'Characters')
                  ],
                ),
              ],
            )),
            AnimatedAlert(
              anyError: isError,
              errorText: passwordController.text.isEmpty
                  ? 'Password is empty'
                  : 'Password is too weak',
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomButton(
        text: 'NEXT',
        onPress: () {
          if (power.length >= 3) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ThirdPage()));
          } else {
            showError();
          }
        },
      ),
    );
  }
}
