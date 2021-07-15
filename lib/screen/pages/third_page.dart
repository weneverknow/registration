part of 'pages.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  Color circleColor = Colors.white;
  bool _goalSelectionStretch = false;
  bool _incomeSelectionStretch = false;
  bool _expenseSelectionStretch = false;

  String _goalSelected = "-Choose Option-";
  String _incomeSelected = "-Choose Option-";
  String _expenseSelected = "-Choose Option-";

  List goalOptions = [
    {"id": 1, "desc": "Savings"},
    {"id": 2, "desc": "Investment"},
    {"id": 3, "desc": "Home Ownership"},
    {"id": 4, "desc": "Pay Off The Car"}
  ];

  List incomeOptions = [
    {"id": 1, "desc": "< 1 Juta"},
    {"id": 2, "desc": "1 Juta - 3 Juta"},
    {"id": 3, "desc": "3 Juta - 4 Juta"},
    {"id": 4, "desc": "> 5 Juta"}
  ];

  List expenseOptions = [
    {"id": 1, "desc": "< 1 Juta"},
    {"id": 2, "desc": ">= 1 Juta & < 3 Juta"},
    {"id": 3, "desc": ">= 3 Juta"}
  ];

  @override
  void initState() {
    print('initstate');
    changeColor(() {
      setState(() {
        circleColor = Color(0xFF2A8D2A);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  color: circleColor,
                ),
                CircleNumber(text: '4'),
              ],
            ),
            Positioned.fill(child: GestureDetector(
              onTap: () {
                setState(() {
                  _goalSelectionStretch = false;
                  _incomeSelectionStretch = false;
                  _expenseSelectionStretch = false;
                });
              },
            )),
            BackButtonHeader(
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ContentWrapper(
                alignment: Alignment.topCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: ScreenSize.screenHeight(context) * 0.2,
                    ),
                    TitleText(
                      text: 'Personal Information',
                    ),
                    const SizedBox(
                      height: defaultPadding / 4,
                    ),
                    SubTitleText(
                      text:
                          'Please fill in the information below on your goal for digital saving',
                    ),
                    const SizedBox(height: defaultPadding * 1.5),
                    Flexible(
                      child: Stack(
                        children: [
                          //begin income activation list box
                          buildSelections(
                              topMargin: 140,
                              text: _expenseSelected,
                              topText: 'Expense Income',
                              showList: () {
                                setState(() {
                                  _expenseSelectionStretch =
                                      !_expenseSelectionStretch;
                                });
                              },
                              whichSelectionStretch: _expenseSelectionStretch,
                              options: expenseOptions,
                              key: 'expense'),
                          //end income activation list box
                          //begin income activation list box
                          buildSelections(
                              topMargin: 70,
                              text: _incomeSelected,
                              topText: 'Monthly Income',
                              showList: () {
                                setState(() {
                                  _incomeSelectionStretch =
                                      !_incomeSelectionStretch;
                                });
                              },
                              whichSelectionStretch: _incomeSelectionStretch,
                              options: incomeOptions,
                              key: 'income'),
                          //end income activation list box
                          //begin goal activation list box
                          buildSelections(
                              text: _goalSelected,
                              topText: 'Goal for activation',
                              showList: () {
                                setState(() {
                                  _goalSelectionStretch =
                                      !_goalSelectionStretch;
                                });
                              },
                              whichSelectionStretch: _goalSelectionStretch,
                              options: goalOptions,
                              key: 'goal')
                          //end goal activation list box
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
      bottomNavigationBar: CustomButton(
        text: 'NEXT',
        onPress: () {
          if (_goalSelected == '-Choose Option-' ||
              _incomeSelected == '-Choose Option-' ||
              _expenseSelected == '-Choose Option-') {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('any data still empty')));
          } else {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => FourthPage()));
          }
        },
      ),
    );
  }

  Widget buildSelections({
    required String topText,
    required String text,
    Function()? showList,
    required bool whichSelectionStretch,
    required List<dynamic> options,
    double? topMargin,
    required String key,
  }) {
    return CustomListBox(
        topMargin: topMargin ?? 0,
        topText: topText,
        text: (key == 'goal'
            ? _goalSelected
            : (key == 'income' ? _incomeSelected : _expenseSelected)),
        onTap: showList,
        listChild: whichSelectionStretch
            ? ExpandedListBox(
                options: options,
                child: ListView.builder(
                    padding: EdgeInsets.all(0),
                    itemCount: options.length,
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: TextButton(
                              style: TextButton.styleFrom(
                                  alignment: Alignment.centerLeft,
                                  primary: Colors.black,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: defaultPadding)),
                              onPressed: () {
                                setState(() {
                                  if (key == 'goal') {
                                    _goalSelected = options[index]['desc'];
                                    _goalSelectionStretch = false;
                                  } else if (key == 'income') {
                                    _incomeSelected = options[index]['desc'];
                                    _incomeSelectionStretch = false;
                                  } else {
                                    _expenseSelected = options[index]['desc'];
                                    _expenseSelectionStretch = false;
                                  }
                                });
                              },
                              child: SubTitleText(
                                color: Colors.black,
                                text: options[index]['desc'],
                              )),
                        )),
              )
            : const SizedBox.shrink());
  }
}
