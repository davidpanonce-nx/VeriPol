import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:veripol/controller/data_controller.dart';

import 'package:veripol/controller/page_controllers.dart';
import '../components/themes.dart';
import 'veripol_candidates_wrapper.dart';
import 'veripol_home.dart';
import 'veripol_learn.dart';

class DashboardWrapper extends StatefulWidget {
  const DashboardWrapper({
    Key? key,
  }) : super(key: key);

  @override
  State<DashboardWrapper> createState() => _DashboardWrapperState();
}

class _DashboardWrapperState extends State<DashboardWrapper> {
  @override
  void initState() {
    getCacheData();
    super.initState();
  }

  void getCacheData() async {
    DataController().getUserDataFromCache();
  }

  @override
  Widget build(BuildContext context) {
    final bottomNavController = Provider.of<PageControllers>(context);
    final size = MediaQuery.of(context).size;
    final scale = mockUpWidth / size.width;
    final textScale = size.width / mockUpWidth;
    return Scaffold(
      backgroundColor: veripolColors.background,
      bottomNavigationBar: VeripolBottomNavBar(size: size),
      body: bottomNavController.bottomNavIndex == 0
          ? VeripolHome(
              size: size,
              scale: scale,
              textScale: textScale,
            )
          : bottomNavController.bottomNavIndex == 1
              ? VeripolLearn(size: size, scale: scale, textScale: textScale)
              : VeripolCandidatesWrapper(
                  size: size, scale: scale, textScale: textScale),
    );
  }
}

class VeripolBottomNavBar extends StatelessWidget {
  const VeripolBottomNavBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    final _bottomNavController = Provider.of<PageControllers>(context);
    return Container(
      width: size.width,
      height: 75 / mockUpHeight * size.height,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      padding: EdgeInsets.fromLTRB(
        55 / mockUpWidth * size.width,
        15 / mockUpHeight * size.height,
        39 / mockUpWidth * size.width,
        15 / mockUpHeight * size.height,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InkWell(
            onTap: () => _bottomNavController.setBottomNavIndex(0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 24 / mockUpWidth * size.width,
                  height: 24 / mockUpWidth * size.width,
                  child: FittedBox(
                    child: SvgPicture.asset(
                      "assets/home.svg",
                      color: _bottomNavController.bottomNavIndex == 0
                          ? veripolColors.passionRed
                          : const Color(0xffF4F4E8),
                    ),
                  ),
                ),
                SizedBox(
                  height: 6 / mockUpHeight * size.height,
                ),
                SizedBox(
                  width: 35 / mockUpWidth * size.width,
                  child: FittedBox(
                    child: Text(
                      "Home",
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          height: 0.80,
                          letterSpacing: 0,
                          color: _bottomNavController.bottomNavIndex == 0
                              ? veripolColors.passionRed
                              : const Color(0xffF4F4E8),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 81 / mockUpWidth * size.width,
          ),
          InkWell(
            onTap: () => _bottomNavController.setBottomNavIndex(1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 24 / mockUpWidth * size.width,
                  height: 24 / mockUpWidth * size.width,
                  child: FittedBox(
                    child: SvgPicture.asset(
                      "assets/book-open.svg",
                      color: _bottomNavController.bottomNavIndex == 1
                          ? veripolColors.passionRed
                          : const Color(0xffF4F4E8),
                    ),
                  ),
                ),
                SizedBox(
                  height: 6 / mockUpHeight * size.height,
                ),
                SizedBox(
                  width: 33 / mockUpWidth * size.width,
                  child: FittedBox(
                    child: Text(
                      "Learn",
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          height: 0.80,
                          letterSpacing: 0,
                          color: _bottomNavController.bottomNavIndex == 1
                              ? veripolColors.passionRed
                              : const Color(0xffF4F4E8),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 65 / mockUpWidth * size.width,
          ),
          InkWell(
            onTap: () => _bottomNavController.setBottomNavIndex(2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 24 / mockUpWidth * size.width,
                  height: 24 / mockUpWidth * size.width,
                  child: FittedBox(
                    child: SvgPicture.asset(
                      "assets/candidates.svg",
                      color: _bottomNavController.bottomNavIndex == 2
                          ? veripolColors.passionRed
                          : const Color(0xffF4F4E8),
                    ),
                  ),
                ),
                SizedBox(
                  height: 6 / mockUpHeight * size.height,
                ),
                SizedBox(
                  width: 67 / mockUpWidth * size.width,
                  child: FittedBox(
                    child: Text(
                      "Candidates",
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          height: 0.80,
                          letterSpacing: 0,
                          color: _bottomNavController.bottomNavIndex == 2
                              ? veripolColors.passionRed
                              : const Color(0xffF4F4E8),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
