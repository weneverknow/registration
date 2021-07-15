part of 'pages.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipPath(
        clipper: MyClipper(),
        child: SingleChildScrollView(
          child: Container(
            width: ScreenSize.screenWidth(context),
            height: (ScreenSize.screenHeight(context) * 0.8) - 62,
            color: greyColor,
            padding: EdgeInsets.fromLTRB(
                defaultPadding, (defaultPadding * 3), defaultPadding, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                TitleFirstPage(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: defaultPadding),
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
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: greyColor),
                    alignment: Alignment.center,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Email',
                          prefixIcon: Icon(Icons.mail_outline_outlined),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none),
                    ),
                  ),
                ),
                // Flexible(
                //     child: Align(
                //   alignment: Alignment.bottomCenter,
                //   child: CustomButton(text: 'NEXT'),
                // ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
