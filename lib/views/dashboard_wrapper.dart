import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:veripol/controller/data_controller.dart';

import 'package:veripol/controller/page_controllers.dart';
import 'package:veripol/models/models.dart';
import 'package:veripol/views/splash.dart';
import '../components/themes.dart';
import '../controller/my_candidate_data_controller.dart';
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
  bool isLoading = true;

  void setLoading(val) async {
    Future.delayed(const Duration(seconds: 2)).whenComplete(() {
      getCacheData()
          .whenComplete(() => Future.delayed(const Duration(seconds: 1), () {}))
          .whenComplete(
            () => setState(() {
              isLoading = false;
            }),
          );
    });
  }

  @override
  void initState() {
    setLoading(true);
    super.initState();
  }

  Future<void> getCacheData() async {
    Map<String, dynamic> data = await DataController().userStarterData();
    if (data.isNotEmpty) {
      VeriPolUserData userData = VeriPolUserData().fromMap(data);
      DataController().cacheUserData(userData).whenComplete(() {
        DataController().getUserDataFromCache().whenComplete(() {
          MyCandidatesDataController().setRuntimeCountDatafromDB(
            DataController().userData["candidates"]["total"],
            DataController().userData["candidates"]["national"],
            DataController().userData["candidates"]["provincial"],
            DataController().userData["candidates"]["municipal"],
            DataController().userData["candidates"]["houseOfRepDistricts"],
            DataController().userData["candidates"]["provincialBoardDistricts"],
            DataController().userData["candidates"]["councilorDistricts"],
          );
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomNavController = Provider.of<PageControllers>(context);
    final size = MediaQuery.of(context).size;
    final scale = mockUpWidth / size.width;
    final textScale = size.width / mockUpWidth;
    return isLoading
        ? const VeripolSplash()
        : Scaffold(
            backgroundColor: veripolColors.background,
            bottomNavigationBar: VeripolBottomNavBar(size: size),
            body: bottomNavController.bottomNavIndex == 0
                ? VeripolHome(
                    size: size,
                    scale: scale,
                    textScale: textScale,
                  )
                : bottomNavController.bottomNavIndex == 1
                    ? VeripolLearn(
                        size: size, scale: scale, textScale: textScale)
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
    final bottomNavController = Provider.of<PageControllers>(context);
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
            onTap: () => bottomNavController.setBottomNavIndex(0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 24 / mockUpWidth * size.width,
                  height: 24 / mockUpWidth * size.width,
                  child: FittedBox(
                    child: SvgPicture.asset(
                      "assets/home.svg",
                      colorFilter: ColorFilter.mode(
                        bottomNavController.bottomNavIndex == 0
                            ? veripolColors.passionRed
                            : const Color(0xffF4F4E8),
                        BlendMode.srcIn,
                      ),
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
                          color: bottomNavController.bottomNavIndex == 0
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
            onTap: () => bottomNavController.setBottomNavIndex(1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 24 / mockUpWidth * size.width,
                  height: 24 / mockUpWidth * size.width,
                  child: FittedBox(
                    child: SvgPicture.asset(
                      "assets/book-open.svg",
                      colorFilter: ColorFilter.mode(
                        bottomNavController.bottomNavIndex == 1
                            ? veripolColors.passionRed
                            : const Color(0xffF4F4E8),
                        BlendMode.srcIn,
                      ),
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
                          color: bottomNavController.bottomNavIndex == 1
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
            onTap: () => bottomNavController.setBottomNavIndex(2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 24 / mockUpWidth * size.width,
                  height: 24 / mockUpWidth * size.width,
                  child: FittedBox(
                    child: SvgPicture.asset(
                      "assets/candidates.svg",
                      colorFilter: ColorFilter.mode(
                        bottomNavController.bottomNavIndex == 2
                            ? veripolColors.passionRed
                            : const Color(0xffF4F4E8),
                        BlendMode.srcIn,
                      ),
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
                          color: bottomNavController.bottomNavIndex == 2
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
