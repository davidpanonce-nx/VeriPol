import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:veripol/views/authentication/sign_up_selection.dart';

import '../components/featured_articles_card.dart';
import '../components/left_off_card.dart';
import '../components/topics_card.dart';
import '../controller/data_controller.dart';
import '../controller/page_controllers.dart';
import '../components/themes.dart';
import '../functions.dart';
import 'candidates/candidates_type.dart';
import 'registration location/registered_voter.dart';

class VeripolHome extends StatefulWidget {
  const VeripolHome({
    Key? key,
    required this.size,
    required this.scale,
    required this.textScale,
  }) : super(key: key);

  final Size size;
  final double scale;
  final double textScale;

  @override
  State<VeripolHome> createState() => _VeripolHomeState();
}

class _VeripolHomeState extends State<VeripolHome> {
  int daysTillElection = 0;

  @override
  void initState() {
    checkDaysTillElection();

    super.initState();
  }

  checkDaysTillElection() {
    daysTillElection =
        DateTime(2022, 5, 9).difference(DateTime.now()).inDays.toInt();
  }

  @override
  Widget build(BuildContext context) {
    final _pageController = Provider.of<PageControllers>(context);
    final dataController = Provider.of<DataController>(context);
    return SizedBox(
      width: widget.size.width,
      height: widget.size.height,
      child: Stack(
        children: [
          Positioned(
            top: 110 / mockUpHeight * widget.size.height,
            child: Image.asset(
              "assets/bg_pattern.png",
              scale: widget.scale,
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: 100 / mockUpHeight * widget.size.height,
                bottom: 40 / mockUpHeight * widget.size.height,
              ),
              child: SizedBox(
                width: widget.size.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: 26 / mockUpHeight * widget.size.height,
                    ),
                    SizedBox(
                      width: widget.size.width,
                      height: 162 / mockUpHeight * widget.size.height,
                      child: Stack(
                        children: [
                          Positioned(
                            right: -30 / mockUpWidth * widget.size.width,
                            top: 5 / mockUpHeight * widget.size.height,
                            child: Text(
                              daysTillElection.toString(),
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 165,
                                  height: 0.825,
                                  letterSpacing: 0,
                                  color: daysTillElection >= 31
                                      ? veripolColors.blueTrust
                                      : daysTillElection >= 11 &&
                                              daysTillElection < 31
                                          ? veripolColors.sunYellow
                                          : veripolColors.passionRed,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 10 / mockUpHeight * widget.size.height,
                            left: 24 / mockUpWidth * widget.size.width,
                            child: Container(
                              width: 327 / mockUpWidth * widget.size.width,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(
                                    10 / mockUpWidth * widget.size.width),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width:
                                        200 / mockUpWidth * widget.size.width,
                                    height:
                                        131 / mockUpHeight * widget.size.height,
                                    padding: EdgeInsets.fromLTRB(
                                      8 / mockUpWidth * widget.size.width,
                                      8 / mockUpHeight * widget.size.height,
                                      0 / mockUpWidth * widget.size.width,
                                      8 / mockUpHeight * widget.size.height,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          textScaleFactor: widget.textScale,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "Hey, " +
                                                    dataController.name +
                                                    "!",
                                                style: GoogleFonts.inter(
                                                  textStyle: const TextStyle(
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    height: 2,
                                                    letterSpacing: 0,
                                                    color: Color(0xffF4F4E8),
                                                  ),
                                                ),
                                              ),
                                              TextSpan(
                                                text: "\nIt's ",
                                                style: GoogleFonts.inter(
                                                  textStyle: const TextStyle(
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 24,
                                                    height: 1.3,
                                                    letterSpacing: 0,
                                                    color: Color(0xffF4F4E8),
                                                  ),
                                                ),
                                              ),
                                              TextSpan(
                                                text: daysTillElection
                                                        .toString() +
                                                    " days ",
                                                style: GoogleFonts.inter(
                                                  textStyle: TextStyle(
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 24,
                                                    height: 1.3,
                                                    letterSpacing: 0,
                                                    color: daysTillElection >=
                                                            31
                                                        ? veripolColors
                                                            .blueTrust
                                                        : daysTillElection >=
                                                                    11 &&
                                                                daysTillElection <
                                                                    31
                                                            ? veripolColors
                                                                .sunYellow
                                                            : veripolColors
                                                                .passionRed,
                                                  ),
                                                ),
                                              ),
                                              TextSpan(
                                                text: "until\n",
                                                style: GoogleFonts.inter(
                                                  textStyle: const TextStyle(
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 24,
                                                    height: 1.3,
                                                    letterSpacing: 0,
                                                    color: Color(0xffF4F4E8),
                                                  ),
                                                ),
                                              ),
                                              TextSpan(
                                                text: "Election Day.",
                                                style: GoogleFonts.inter(
                                                  textStyle: const TextStyle(
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 24,
                                                    height: 1.3,
                                                    letterSpacing: 0,
                                                    color: Color(0xffF4F4E8),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 11 /
                                              mockUpHeight *
                                              widget.size.height,
                                        ),
                                        Text(
                                          _pageController.dateTimeFormatter(
                                              DateTime.now()),
                                          textAlign: TextAlign.right,
                                          textScaleFactor: widget.textScale,
                                          style: GoogleFonts.inter(
                                            textStyle: const TextStyle(
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 10,
                                              height: 1,
                                              letterSpacing: 0,
                                              color: Color(0xffF6C15C),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        121 / mockUpWidth * widget.size.width,
                                    height:
                                        131 / mockUpHeight * widget.size.height,
                                    child: FittedBox(
                                      fit: BoxFit.fill,
                                      child: SvgPicture.asset(
                                          "assets/thumbprint.svg"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 21 / mockUpHeight * widget.size.height,
                    ),
                    SizedBox(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: widget.size.width / 3,
                                height: 10 / mockUpHeight * widget.size.height,
                                decoration: BoxDecoration(
                                    color: veripolColors.sunYellow),
                              ),
                              Container(
                                width: widget.size.width / 3,
                                height: 10 / mockUpHeight * widget.size.height,
                                decoration: BoxDecoration(
                                    color: veripolColors.blueTrust),
                              ),
                              Container(
                                width: widget.size.width / 3,
                                height: 10 / mockUpHeight * widget.size.height,
                                decoration: BoxDecoration(
                                    color: veripolColors.passionRed),
                              )
                            ],
                          ),
                          Container(
                            height: 80 / mockUpHeight * widget.size.height,
                            decoration: const BoxDecoration(
                              color: Color(0xff141414),
                            ),
                            padding: EdgeInsets.fromLTRB(
                              42 / mockUpWidth * widget.size.width,
                              9 / mockUpHeight * widget.size.height,
                              42 / mockUpWidth * widget.size.width,
                              19 / mockUpHeight * widget.size.height,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '2022 ELECTIONS',
                                  style: veripolTextStyles.labelSmall.copyWith(
                                    color: Colors.white.withOpacity(0.50),
                                  ),
                                ),
                                SizedBox(
                                  height: 4 / mockUpHeight * widget.size.height,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Go to Candidates",
                                      textScaleFactor: widget.textScale,
                                      style:
                                          veripolTextStyles.titleLarge.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        dataController.getLocationData();
                                        dataController.hasLocationData
                                            ? Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const CandidateTypeSelection(),
                                                ),
                                              )
                                            : Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const RegisteredVoterSelection(),
                                                ),
                                              );
                                      },
                                      child: Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                        size: 30 /
                                            mockUpWidth *
                                            widget.size.width,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                width: widget.size.width / 3,
                                height: 10 / mockUpHeight * widget.size.height,
                                decoration: BoxDecoration(
                                    color: veripolColors.passionRed),
                              ),
                              Container(
                                  width: widget.size.width / 3,
                                  height:
                                      10 / mockUpHeight * widget.size.height,
                                  decoration: BoxDecoration(
                                      color: veripolColors.sunYellow)),
                              Container(
                                width: widget.size.width / 3,
                                height: 10 / mockUpHeight * widget.size.height,
                                decoration: BoxDecoration(
                                    color: veripolColors.blueTrust),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 21 / mockUpHeight * widget.size.height,
                    ),
                    SizedBox(
                      width: widget.size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 24 / mockUpWidth * widget.size.width,
                                ),
                                child: Text(
                                  'Topics',
                                  textScaleFactor: widget.textScale,
                                  style: veripolTextStyles.labelLarge.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5 / mockUpHeight * widget.size.height,
                              ),
                              SizedBox(
                                width: widget.size.width,
                                height: 210 / mockUpHeight * widget.size.height,
                                child: ListView.builder(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 24 /
                                            mockUpWidth *
                                            widget.size.width),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 3,
                                    itemBuilder: (BuildContext context, index) {
                                      return Padding(
                                        padding: index == 0
                                            ? const EdgeInsets.only(left: 0)
                                            : EdgeInsets.only(
                                                left: 24 /
                                                    mockUpWidth *
                                                    widget.size.width,
                                              ),
                                        child: TopicsCard(
                                          size: widget.size,
                                          textScale: widget.textScale,
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 24 / mockUpHeight * widget.size.height,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 24 / mockUpWidth * widget.size.width,
                                ),
                                child: Text(
                                  'Continue where you left off',
                                  textScaleFactor: widget.textScale,
                                  style: veripolTextStyles.labelLarge.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5 / mockUpHeight * widget.size.height,
                              ),
                              SizedBox(
                                width: widget.size.width,
                                height: 160 / mockUpHeight * widget.size.height,
                                child: ListView.builder(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 24 /
                                            mockUpWidth *
                                            widget.size.width),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 4,
                                    itemBuilder: (BuildContext context, index) {
                                      return Padding(
                                        padding: index == 0
                                            ? const EdgeInsets.only(left: 0)
                                            : EdgeInsets.only(
                                                left: 24 /
                                                    mockUpWidth *
                                                    widget.size.width,
                                              ),
                                        child: ContinueWhereYouLeftOff(
                                          size: widget.size,
                                          textScale: widget.textScale,
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 24 / mockUpHeight * widget.size.height,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 24 / mockUpWidth * widget.size.width,
                                ),
                                child: Text(
                                  'Featured Articles',
                                  textScaleFactor: widget.textScale,
                                  style: veripolTextStyles.labelLarge.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5 / mockUpHeight * widget.size.height,
                              ),
                              SizedBox(
                                width: widget.size.width,
                                height: 210 / mockUpHeight * widget.size.height,
                                child: ListView.builder(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 24 /
                                            mockUpWidth *
                                            widget.size.width),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 4,
                                    itemBuilder: (BuildContext context, index) {
                                      return Padding(
                                        padding: index == 0
                                            ? const EdgeInsets.only(left: 0)
                                            : EdgeInsets.only(
                                                left: 24 /
                                                    mockUpWidth *
                                                    widget.size.width,
                                              ),
                                        child: FeaturedArticlesCard(
                                          size: widget.size,
                                          textScale: widget.textScale,
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: widget.size.width,
              height: 120 / mockUpHeight * widget.size.height,
              decoration: BoxDecoration(
                color: veripolColors.background,
              ),
              padding: EdgeInsets.only(
                top: 76 / mockUpHeight * widget.size.height,
                right: 33 / mockUpWidth * widget.size.width,
                left: 24 / mockUpWidth * widget.size.width,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/VeriPol_Dark.png",
                    width: 30,
                    scale: widget.scale,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await signOut();
                      _pageController.clearControllers();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpSelection()));
                    },
                    child: Icon(
                      Icons.logout,
                      size: 30 / mockUpWidth * widget.size.width,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
