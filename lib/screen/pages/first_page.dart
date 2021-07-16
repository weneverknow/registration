part of 'pages.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  late TextEditingController _emailController;
  bool isValid = false;
  bool _showError = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      print('document ready');
    });
    isValid = false;
    _showError = false;
    _emailController = TextEditingController(text: '');
  }

  Future<void> onClick(bool isError) async {
    await Future.delayed(Duration(milliseconds: 400));
    setState(() {
      _showError = isError;
      _emailController.text = '';
      isValid = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyColor,
      body: Stack(
        children: [
          IndieBackground(),
          Align(
              alignment: Alignment.bottomCenter,
              child: ClipperBackground(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TitleFirstPage(),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: defaultPadding),
                      child: Text(
                        'Welcome to The Bank of The Future.\nManage and track your accounts on the go.',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: Colors.black),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(
                      height: defaultPadding,
                    ),
                    Container(
                        height: 80,
                        padding: EdgeInsets.symmetric(
                            vertical: defaultPadding / 2,
                            horizontal: defaultPadding / 2),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        alignment: Alignment.center,
                        child: DefaultInputField(
                          prefixIcon: Icon(Icons.mail_outline_outlined),
                          hintText: 'Email',
                          controller: _emailController,
                          onChanged: (val) {
                            setState(() {
                              isValid = val.length > 0;
                              _showError = false;
                            });
                          },
                        )),
                  ],
                ),
              )),
          HeaderContainer(
            children: [
              CircleNumber(text: '1'),
              CircleNumber(text: '2'),
              CircleNumber(text: '3'),
              CircleNumber(text: '4')
            ],
          ),
          AnimatedAlert(
            anyError: _showError,
            errorText: 'Email is not valid',
          )
        ],
      ),
      bottomNavigationBar: CustomButton(
        text: 'NEXT',
        onPress: () async {
          if (isValid) {
            await onClick(false);
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => SecondPage()));
          } else {
            await onClick(true);
          }
        },
      ),
    );
  }
}
