part of 'pages.dart';

class FourthPage extends StatefulWidget {
  const FourthPage({Key? key}) : super(key: key);

  @override
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late CalendarAnimation _animation;
  Color circleColor = Colors.white;
  bool _dateFilled = false;
  bool _timeFilled = false;
  bool _anyError = false;
  @override
  void initState() {
    changeColor(() {
      setState(() {
        circleColor = Color(0xFF2A8D2A);
      });
    });

    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _animation = CalendarAnimation(_controller);
    _controller
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          _controller.forward();
        } else if (status == AnimationStatus.completed) {
          _controller.reverse();
        }
      });
    _controller.forward();
    super.initState();
  }

  DateTime _selectedDate = DateTime.now();
  String _selectedDateString = "-Choose Date-";

  TimeOfDay _selectedTime = TimeOfDay.now();
  String _selectedTimeString = "-Choose Time-";

  void showTime(BuildContext context, bool isAndroid) {
    if (isAndroid) {
      getAndroidTime(context);
    } else {
      getIosDate(context, CupertinoDatePickerMode.time);
    }
  }

  void showDate(BuildContext context, bool isAndroid) {
    if (isAndroid) {
      getAndroidDate(context);
    } else {
      getIosDate(context, CupertinoDatePickerMode.date);
    }
  }

  Future<void> getIosDate(
      BuildContext context, CupertinoDatePickerMode mode) async {
    await showCupertinoModalPopup(
        context: context,
        builder: (context) => Container(
            height: 200,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12))),
            child: CupertinoDatePicker(
                initialDateTime: _selectedDate,
                mode: mode,
                use24hFormat: true,
                onDateTimeChanged: (date) {
                  setState(() {
                    if (mode == CupertinoDatePickerMode.date) {
                      _selectedDate = date;
                      _selectedDateString = date.convert();
                      _dateFilled = true;
                      _anyError = false;
                    } else {
                      TimeOfDay parseTime = TimeOfDay.fromDateTime(
                          DateTime.parse(date.toString()));
                      _selectedTime = parseTime;
                      _selectedTimeString = parseTime.timeToString();
                      _timeFilled = true;
                      _anyError = false;
                    }
                  });
                })));
  }

  Future<void> getAndroidTime(BuildContext context) async {
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (time != null) {
      _selectedTime = time;
      _selectedTimeString = time.timeToString();
      _timeFilled = true;
      _anyError = false;

      setState(() {});
    }
  }

  Future<void> getAndroidDate(BuildContext context) async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021, 7),
      lastDate: DateTime(2022, 12),
    );
    if (date != null && _selectedDate != date) {
      _selectedDate = date;
      _selectedDateString = date.convert();
      _dateFilled = true;
      _anyError = false;
      setState(() {});
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
                  color: circleColor,
                ),
                CircleNumber(
                  text: '4',
                ),
              ],
            ),
            BackButtonHeader(
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            AnimatedBuilder(
                animation: _animation.controller,
                builder: (context, child) {
                  return Container(
                    width: 40 * _animation.scaleAnimation.value,
                    height: 40 * _animation.scaleAnimation.value,
                    margin: EdgeInsets.fromLTRB(
                        defaultPadding,
                        ScreenSize.screenHeight(context) * 0.2,
                        defaultPadding,
                        0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    alignment: Alignment.center,
                    child: Icon(
                        Platform.isAndroid
                            ? Icons.calendar_today_rounded
                            : CupertinoIcons.calendar_today,
                        color: Colors.blue[300],
                        size: 20 * _animation.scaleAnimation.value),
                  );
                }),
            ContentWrapper(
                alignment: Alignment.topCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: (ScreenSize.screenHeight(context) * 0.2) + 80,
                    ),
                    TitleText(
                      text: 'Schedule Video Call',
                    ),
                    const SizedBox(
                      height: defaultPadding / 2,
                    ),
                    SubTitleText(
                      text:
                          'Choose the date and time that you preferred, we will send a link via email to make a video call on the scheduled date and time.',
                    ),
                    const SizedBox(
                      height: defaultPadding,
                    ),
                    Flexible(
                        child: Stack(
                      children: [
                        CustomListBox(
                          topMargin: 70,
                          topText: 'Time',
                          text: _selectedTimeString,
                          onTap: () {
                            showTime(context, Platform.isAndroid);
                          },
                        ),
                        CustomListBox(
                          topText: 'Date',
                          text: _selectedDateString,
                          onTap: () {
                            showDate(context, Platform.isAndroid);
                          },
                        ),
                      ],
                    ))
                  ],
                )),
            AnimatedAlert(
              anyError: _anyError,
              errorText: (_dateFilled == false
                  ? 'Date is empty'
                  : (_timeFilled == false
                      ? 'Time is empty'
                      : 'Date and time are empty')),
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomButton(
        text: 'NEXT',
        onPress: () {
          print(_dateFilled);
          print(_timeFilled);
          setState(() {
            _anyError = (_dateFilled == false || _timeFilled == false);
          });
        },
      ),
    );
  }
}
