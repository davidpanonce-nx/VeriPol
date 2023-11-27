import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:veripol/components/dummy_data.dart';

import '../components/featured_articles_card.dart';
import '../components/topics_card.dart';
import '../controller/data_controller.dart';
import '../controller/page_controllers.dart';
import '../components/themes.dart';
import '../functions.dart';
import '../services/firebase_auth.dart';
import 'candidates/candidates_type.dart';
import 'registration location/registered_voter.dart';

class VeripolHome extends StatefulWidget {
  const VeripolHome({Key? key}) : super(key: key);

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
    if (DateTime.now().month == 5 && DateTime.now().day == 9) {
      daysTillElection = 0;
    } else {
      daysTillElection = DateTime(2022, DateTime.may, 9).difference(DateTime.now()).inDays.toInt() + 1;
    }
  }

  // _launchURLApp() async {
  //   const url = 'https://votepilipinas.com/candidate/afuang-abner.html';
  //   if (await canLaunchUrl(url)) {
  //     await launch(url, enableJavaScript: true, forceWebView: false);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  //

  @override
  Widget build(BuildContext context) {
    final pageController = Provider.of<PageControllers>(context);
    final dataController = Provider.of<DataController>(context);
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          Positioned(
            top: 110,
            child: Image.asset(
              "assets/bg_pattern.png",
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 100, bottom: 40),
              child: SizedBox(
                width: size.width,
                child: Column(
                  children: [
                    const SizedBox(height: 26),
                    SizedBox(
                      width: size.width,
                      height: 183,
                      child: Stack(
                        children: [
                          Visibility(
                            visible: daysTillElection == 0,
                            child: Positioned(
                              top: -80,
                              left: 0,
                              child: Text(
                                'Vote',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 165,
                                    fontWeight: FontWeight.w700,
                                    height: 1.33,
                                    letterSpacing: 0,
                                    color: veripolColors.passionRed.withOpacity(0.80),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: daysTillElection == 0,
                            child: Positioned(
                              top: 40,
                              left: 5,
                              child: Text(
                                'today',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 165,
                                    fontWeight: FontWeight.w700,
                                    height: 1.33,
                                    letterSpacing: 0,
                                    color: veripolColors.passionRed.withOpacity(0.80),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: daysTillElection != 0,
                            child: Positioned(
                              right: -30,
                              top: 10,
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
                                        : daysTillElection >= 11 && daysTillElection < 31
                                            ? veripolColors.sunYellow
                                            : veripolColors.passionRed,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 20,
                            left: 24,
                            child: Container(
                              width: 327,
                              height: 131,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    right: 0,
                                    top: 0,
                                    child: SizedBox(
                                      width: 121,
                                      height: 131,
                                      child: FittedBox(
                                        fit: BoxFit.fill,
                                        child: SvgPicture.asset("assets/thumbprint.svg"),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 17,
                                    top: 11.02,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        daysTillElection == 0
                                            ? RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: dataController.userData["first_name"] == null
                                                          ? "Hey, User!"
                                                          : "Hey, ${dataController.userData["first_name"]}!",
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
                                                      text: "$daysTillElection days ",
                                                      style: GoogleFonts.inter(
                                                        textStyle: TextStyle(
                                                          fontStyle: FontStyle.normal,
                                                          fontWeight: FontWeight.w600,
                                                          fontSize: 24,
                                                          height: 1.3,
                                                          letterSpacing: 0,
                                                          color: daysTillElection >= 31
                                                              ? veripolColors.blueTrust
                                                              : daysTillElection >= 11 && daysTillElection < 31
                                                                  ? veripolColors.sunYellow
                                                                  : veripolColors.passionRed,
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
                                              )
                                            : daysTillElection < 0
                                                ? RichText(
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: dataController.userData["first_name"] == null
                                                              ? "Hey, User!"
                                                              : "Hey, ${dataController.userData["first_name"]}!",
                                                          style: GoogleFonts.inter(
                                                            textStyle: const TextStyle(
                                                              fontStyle: FontStyle.normal,
                                                              fontWeight: FontWeight.w600,
                                                              fontSize: 16,
                                                              height: 1.5,
                                                              letterSpacing: 0,
                                                              color: Color(0xffF4F4E8),
                                                            ),
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text: "\nElections are over,\n",
                                                          style: GoogleFonts.inter(
                                                            textStyle: const TextStyle(
                                                              fontStyle: FontStyle.normal,
                                                              fontWeight: FontWeight.w600,
                                                              fontSize: 21,
                                                              height: 1.5,
                                                              letterSpacing: 0,
                                                              color: Color(0xffF4F4E8),
                                                            ),
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text: "see you in",
                                                          style: GoogleFonts.inter(
                                                            textStyle: const TextStyle(
                                                              fontStyle: FontStyle.normal,
                                                              fontWeight: FontWeight.w600,
                                                              fontSize: 21,
                                                              height: 1.5,
                                                              letterSpacing: 0,
                                                              color: Color(0xffF4F4E8),
                                                            ),
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text: " 2025",
                                                          style: GoogleFonts.inter(
                                                            textStyle: const TextStyle(
                                                              fontStyle: FontStyle.normal,
                                                              fontWeight: FontWeight.w600,
                                                              fontSize: 21,
                                                              height: 1.5,
                                                              letterSpacing: 0,
                                                              color: Color(0xff4E8EFF),
                                                            ),
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text: "!",
                                                          style: GoogleFonts.inter(
                                                            textStyle: const TextStyle(
                                                              fontStyle: FontStyle.normal,
                                                              fontWeight: FontWeight.w600,
                                                              fontSize: 21,
                                                              height: 1.5,
                                                              letterSpacing: 0,
                                                              color: Color(0xffF4F4E8),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                : RichText(
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: dataController.userData["first_name"] == null
                                                              ? "Hey, User!"
                                                              : "Hey, ${dataController.userData["first_name"]}!",
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
                                                          text: "\nCast your votes,\n",
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
                                                          text: "It's Election Day.",
                                                          style: GoogleFonts.inter(
                                                            textStyle: TextStyle(
                                                              fontStyle: FontStyle.normal,
                                                              fontWeight: FontWeight.w600,
                                                              fontSize: 24,
                                                              height: 1.3,
                                                              letterSpacing: 0,
                                                              color: veripolColors.passionRed,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                        const SizedBox(height: 10),
                                        daysTillElection == 0
                                            ? Text(
                                                "Cast your votes on May 09, 2022",
                                                textAlign: TextAlign.right,
                                                style: GoogleFonts.inter(
                                                  textStyle: const TextStyle(
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 8,
                                                    height: 1.25,
                                                    letterSpacing: 0,
                                                    color: Color(0xffF6C15C),
                                                  ),
                                                ),
                                              )
                                            : daysTillElection < 0
                                                ? Text(
                                                    "VeriPol will be back stronger and smarter!",
                                                    textAlign: TextAlign.right,
                                                    style: GoogleFonts.inter(
                                                      textStyle: const TextStyle(
                                                        fontStyle: FontStyle.normal,
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: 8,
                                                        height: 1.25,
                                                        letterSpacing: 0,
                                                        color: Color(0xffF6C15C),
                                                      ),
                                                    ),
                                                  )
                                                : Text(
                                                    "Vote wisely!",
                                                    textAlign: TextAlign.right,
                                                    style: GoogleFonts.inter(
                                                      textStyle: const TextStyle(
                                                        fontStyle: FontStyle.normal,
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: 8,
                                                        height: 1,
                                                        letterSpacing: 0,
                                                        color: Color(0xffF6C15C),
                                                      ),
                                                    ),
                                                  ),
                                      ],
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
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: size.width / 3,
                                height: 10,
                                decoration: BoxDecoration(color: veripolColors.sunYellow),
                              ),
                              Container(
                                width: size.width / 3,
                                height: 10,
                                decoration: BoxDecoration(color: veripolColors.blueTrust),
                              ),
                              Container(
                                width: size.width / 3,
                                height: 10,
                                decoration: BoxDecoration(color: veripolColors.passionRed),
                              )
                            ],
                          ),
                          Container(
                            height: 80,
                            decoration: const BoxDecoration(
                              color: Color(0xff141414),
                            ),
                            padding: const EdgeInsets.fromLTRB(42, 9, 42, 19),
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
                                const SizedBox(height: 4),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Go to Candidates",
                                      style: veripolTextStyles.titleLarge.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        await dataController.getLocationData()
                                            ? Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => const CandidateTypeSelection(),
                                                ),
                                              )
                                            : Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => const RegisteredVoterSelection(),
                                                ),
                                              );
                                      },
                                      child: const Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                        size: 30,
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
                                width: size.width / 3,
                                height: 10,
                                decoration: BoxDecoration(color: veripolColors.passionRed),
                              ),
                              Container(
                                  width: size.width / 3,
                                  height: 10,
                                  decoration: BoxDecoration(color: veripolColors.sunYellow)),
                              Container(
                                width: size.width / 3,
                                height: 10,
                                decoration: BoxDecoration(color: veripolColors.blueTrust),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 21),
                    SizedBox(
                      width: size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 24),
                                child: Text(
                                  'Featured Articles',
                                  style: veripolTextStyles.labelLarge.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                width: size.width,
                                height: 210,
                                child: ListView.builder(
                                    padding: const EdgeInsets.symmetric(horizontal: 24),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: DummyData().articleData.length,
                                    itemBuilder: (BuildContext context, index) {
                                      return Padding(
                                        padding: index == 0
                                            ? const EdgeInsets.only(left: 0)
                                            : const EdgeInsets.only(left: 24),
                                        child: FeaturedArticlesCard(
                                          size: size,
                                          data: DummyData().articleData[index],
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          ),
                          // SizedBox(
                          //   height: 24 ,
                          // ),
                          // Column(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     Padding(
                          //       padding: EdgeInsets.only(
                          //         left: 24 ,
                          //       ),
                          //       child: Text(
                          //         'Continue where you left off',
                          //         textScaleFactor: widget.textScale,
                          //         style: veripolTextStyles.labelLarge.copyWith(
                          //           color: Colors.black,
                          //         ),
                          //       ),
                          //     ),
                          //     SizedBox(
                          //       height: 5 ,
                          //     ),
                          //     SizedBox(
                          //       width: size.width,
                          //       height: 160 ,
                          //       child: ListView.builder(
                          //           padding: EdgeInsets.symmetric(
                          //               horizontal: 24 /
                          //                   mockUpWidth *
                          //                   size.width),
                          //           shrinkWrap: true,
                          //           scrollDirection: Axis.horizontal,
                          //           itemCount:
                          //               DummyData().leftOffCardData.length,
                          //           itemBuilder: (BuildContext context, index) {
                          //             return Padding(
                          //               padding: index == 0
                          //                   ? const EdgeInsets.only(left: 0)
                          //                   : EdgeInsets.only(
                          //                       left: 24 /
                          //                           mockUpWidth *
                          //                           size.width,
                          //                     ),
                          //               child: ContinueWhereYouLeftOff(
                          //                 size: size,
                          //                 textScale: widget.textScale,
                          //                 data: DummyData()
                          //                     .leftOffCardData[index],
                          //               ),
                          //             );
                          //           }),
                          //     ),
                          //   ],
                          // ),
                          const SizedBox(height: 24),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 24),
                                child: Text(
                                  'Topics',
                                  style: veripolTextStyles.labelLarge.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                width: size.width,
                                height: 210,
                                child: ListView.builder(
                                    padding: const EdgeInsets.symmetric(horizontal: 24),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: DummyData().topicCardData.length,
                                    itemBuilder: (BuildContext context, index) {
                                      return Padding(
                                        padding: index == 0
                                            ? const EdgeInsets.only(left: 0)
                                            : const EdgeInsets.only(left: 24),
                                        child: TopicsCard(
                                          size: size,
                                          data: DummyData().topicCardData[index],
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          ),
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
              width: size.width,
              height: 120,
              decoration: BoxDecoration(
                color: veripolColors.background,
              ),
              padding: const EdgeInsets.only(top: 76, right: 33, left: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/VeriPol_Dark.png", width: 30),
                  GestureDetector(
                    onTap: () async {
                      if (pageController.isGoogleAccount) {
                        await FirebaseAuthService().signOutFromGoogle();
                      } else {
                        await signOut();
                        pageController.clearControllers();
                      }

                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //             const VeriPolAuthWrapper()));
                    },
                    child: const Icon(Icons.logout, size: 30),
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
