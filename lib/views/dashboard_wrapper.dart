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
      getCacheData().whenComplete(() => Future.delayed(const Duration(seconds: 1), () {})).whenComplete(
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
    return isLoading
        ? const VeripolSplash()
        : Scaffold(
            backgroundColor: veripolColors.background,
            bottomNavigationBar: const VeripolBottomNavBar(),
            body: bottomNavController.bottomNavIndex == 0
                ? const VeripolHome()
                : bottomNavController.bottomNavIndex == 1
                    ? const VeripolLearn()
                    : const VeripolCandidatesWrapper(),
          );
  }
}

class VeripolBottomNavBar extends StatelessWidget {
  const VeripolBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottomNavController = Provider.of<PageControllers>(context);
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 75,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      padding: const EdgeInsets.fromLTRB(55, 15, 39, 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InkWell(
            onTap: () => bottomNavController.setBottomNavIndex(0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: FittedBox(
                    child: SvgPicture.asset(
                      "assets/home.svg",
                      colorFilter: ColorFilter.mode(
                        bottomNavController.bottomNavIndex == 0 ? veripolColors.passionRed : const Color(0xffF4F4E8),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                SizedBox(
                  width: 35,
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
          const SizedBox(
            width: 81,
          ),
          InkWell(
            onTap: () => bottomNavController.setBottomNavIndex(1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: FittedBox(
                    child: SvgPicture.asset(
                      "assets/book-open.svg",
                      colorFilter: ColorFilter.mode(
                        bottomNavController.bottomNavIndex == 1 ? veripolColors.passionRed : const Color(0xffF4F4E8),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                SizedBox(
                  width: 33,
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
          const SizedBox(
            width: 65,
          ),
          InkWell(
            onTap: () => bottomNavController.setBottomNavIndex(2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: FittedBox(
                    child: SvgPicture.asset(
                      "assets/candidates.svg",
                      colorFilter: ColorFilter.mode(
                        bottomNavController.bottomNavIndex == 2 ? veripolColors.passionRed : const Color(0xffF4F4E8),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                SizedBox(
                  width: 67,
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
