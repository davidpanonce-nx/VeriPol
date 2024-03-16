import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veripol/core/routes/routes.dart';

import '../../components/dot_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int pageCount = 3;
  int pageIndex = 0;
  final pageViewController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/bg_pattern.png'),
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              'assets/tr_wave.png',
              width: 250,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'assets/bl_wave.png',
              width: 250,
            ),
          ),
          Positioned(
            top: 80,
            left: size.width / 2 - (((20.0 * pageCount)) / 2),
            child: DotIndicator(
              pageCount: pageCount,
              pageIndex: pageIndex,
            ),
          ),
          SizedBox(
            height: size.height,
            width: size.width,
            child: PageView(
              controller: pageViewController,
              onPageChanged: (val) {
                setState(() {
                  pageIndex = val;
                });
              },
              children: [
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/mobile_12.png',
                      ),
                      Text(
                        'My Candidates',
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w700,
                            fontSize: 28,
                            height: 1.5,
                            letterSpacing: 0,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 295,
                        child: Text(
                          'Do your research and Fill in your ballot before entering the polling place',
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              height: 1.5,
                              letterSpacing: 0,
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/mobile_34.png'),
                      Text(
                        'Candidate Profile',
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w700,
                            fontSize: 28,
                            height: 1.5,
                            letterSpacing: 0,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 295,
                        child: Text(
                          'Learn about the candidates through our candidates profile feature',
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              height: 1.5,
                              letterSpacing: 0,
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/mobile_56.png',
                      ),
                      Text(
                        'Courses',
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w700,
                            fontSize: 28,
                            height: 1.5,
                            letterSpacing: 0,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 295,
                        child: Text(
                          'Learn about the positions the candidates are running for',
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              height: 1.5,
                              letterSpacing: 0,
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              width: size.width,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  pageIndex == 0
                      ? Container()
                      : InkWell(
                          onTap: () {
                            pageIndex--;
                            if (pageIndex < 0) pageIndex = 0;
                            pageViewController.animateToPage(pageIndex,
                                duration: const Duration(milliseconds: 250), curve: Curves.easeInOut);
                            setState(() {});
                          },
                          child: SizedBox(
                            width: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Back',
                                  style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      height: 1.5,
                                      letterSpacing: 0,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                  InkWell(
                    onTap: () {
                      if (pageIndex + 1 == pageCount) {
                        context.pushReplacement(Routes.authHome);
                      } else {
                        pageIndex++;
                        if (pageIndex > pageCount) pageIndex = pageCount;
                        pageViewController.animateToPage(pageIndex,
                            duration: const Duration(milliseconds: 250), curve: Curves.easeInOut);
                        setState(() {});
                      }
                    },
                    child: Container(
                      width: pageIndex + 1 == pageCount ? 100 : 80,
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 7.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFF051923),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            pageIndex + 1 == pageCount ? "Let's Go" : 'Next',
                            style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                height: 1.5,
                                letterSpacing: 0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
