import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:veripol/components/loading.dart';
import 'package:veripol/controller/my_candidate_data_controller.dart';

import '../../components/themes.dart';
import '../../controller/data_controller.dart';
import '../candidates/candidates_type.dart';

class Voter extends StatefulWidget {
  const Voter({
    Key? key,
    this.answer,
  }) : super(key: key);

  final bool? answer;
  @override
  State<Voter> createState() => _VoterState();
}

class _VoterState extends State<Voter> {
  String? region;
  String? province;
  String? city;
  String? barangay;

  bool isLoading = false;

  setLoading(val) {
    setState(() {
      isLoading = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scale = mockUpWidth / size.width;
    final textScale = size.width / mockUpWidth;
    final dataController = Provider.of<DataController>(context);
    final myCandidatesDataController =
        Provider.of<MyCandidatesDataController>(context);
    return isLoading
        ? const LoadingScreen()
        : Scaffold(
            backgroundColor: veripolColors.background,
            body: SizedBox(
              width: size.width,
              height: size.height,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    child: Image.asset(
                      "assets/bg_pattern.png",
                      scale: scale,
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      width: size.width,
                      height: size.height,
                      padding: EdgeInsets.only(
                        top: 148 / mockUpHeight * size.height,
                        left: 10 / mockUpWidth * size.width,
                        right: 10 / mockUpWidth * size.width,
                      ),
                      child: Column(
                        children: [
                          Text(
                            widget.answer ?? false
                                ? "Where are you registered?"
                                : "Whose local candidates do you want to know more about?",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.openSans(
                              textStyle: const TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w700,
                                fontSize: 22,
                                height: 1.27,
                                letterSpacing: 0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 59 / mockUpHeight * size.height,
                          ),
                          DropdownButtonFormField2(
                            isExpanded: true,
                            dropdownMaxHeight: 200 / mockUpHeight * size.height,
                            offset:
                                Offset(0, 10.0 / mockUpHeight * size.height),
                            decoration: InputDecoration(
                              hintText: "Select Region",
                              hintStyle: veripolTextStyles.bodyLarge.copyWith(
                                color: veripolColors.nightSky.withOpacity(0.50),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  4 / mockUpWidth * size.width,
                                ),
                                borderSide: BorderSide(
                                  color: veripolColors.nightSky,
                                  width: 5 / mockUpWidth * size.width,
                                ),
                              ),
                            ),
                            items: dataController.regions.map((e) {
                              return DropdownMenuItem(
                                child: Text(
                                  e,
                                  textScaleFactor: textScale,
                                  maxLines: 2,
                                  style: veripolTextStyles.bodyLarge.copyWith(
                                    color: veripolColors.nightSky,
                                  ),
                                ),
                                value: e,
                              );
                            }).toList(),
                            onChanged: (val) {
                              setState(() {
                                region = val.toString();
                                province = null;
                                city = null;
                                barangay = null;
                              });

                              dataController.clearProvinceData();
                              dataController.clearCityData();
                              dataController.clearBarangayData();
                              if (val.toString() ==
                                  "National Capital Region (NCR)") {
                                dataController.getNCRcities(region!);
                              } else {
                                dataController.getProvinces(region!);
                              }
                            },
                            value: region,
                          ),
                          region == "National Capital Region (NCR)"
                              ? Container(
                                  margin: EdgeInsets.only(
                                    top: 15 / mockUpHeight * size.height,
                                  ),
                                  child: DropdownButtonFormField2(
                                    isExpanded: true,
                                    dropdownMaxHeight:
                                        200 / mockUpHeight * size.height,
                                    offset: Offset(
                                        0, 10.0 / mockUpHeight * size.height),
                                    decoration: InputDecoration(
                                      hintText: "Select City",
                                      hintStyle:
                                          veripolTextStyles.bodyLarge.copyWith(
                                        color: veripolColors.nightSky
                                            .withOpacity(0.50),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          4 / mockUpWidth * size.width,
                                        ),
                                        borderSide: BorderSide(
                                          color: veripolColors.nightSky,
                                          width: 5 / mockUpWidth * size.width,
                                        ),
                                      ),
                                    ),
                                    items: dataController.cities.map((e) {
                                      return DropdownMenuItem(
                                        child: Text(
                                          e,
                                          textScaleFactor: textScale,
                                          maxLines: 2,
                                          style: veripolTextStyles.bodyLarge
                                              .copyWith(
                                            color: veripolColors.nightSky,
                                          ),
                                        ),
                                        value: e,
                                      );
                                    }).toList(),
                                    onTap: null,
                                    onChanged: (val) {
                                      setState(() {
                                        city = val.toString();
                                        dataController
                                            .setSelectedCity(val.toString());
                                        barangay = null;
                                      });
                                      dataController.clearBarangayData();
                                      dataController.getNCRbarangays(
                                          region!, city!);
                                    },
                                    value: city,
                                  ),
                                )
                              : region != null
                                  ? Container(
                                      margin: EdgeInsets.only(
                                        top: 15 / mockUpHeight * size.height,
                                      ),
                                      child: DropdownButtonFormField2(
                                        isExpanded: true,
                                        dropdownMaxHeight:
                                            200 / mockUpHeight * size.height,
                                        offset: Offset(0,
                                            10.0 / mockUpHeight * size.height),
                                        decoration: InputDecoration(
                                          hintText: "Select Province",
                                          hintStyle: veripolTextStyles.bodyLarge
                                              .copyWith(
                                            color: veripolColors.nightSky
                                                .withOpacity(0.50),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              4 / mockUpWidth * size.width,
                                            ),
                                            borderSide: BorderSide(
                                              color: veripolColors.nightSky,
                                              width:
                                                  5 / mockUpWidth * size.width,
                                            ),
                                          ),
                                        ),
                                        items:
                                            dataController.provinces.map((e) {
                                          return DropdownMenuItem(
                                            child: Text(
                                              e,
                                              textScaleFactor: textScale,
                                              maxLines: 2,
                                              style: veripolTextStyles.bodyLarge
                                                  .copyWith(
                                                color: veripolColors.nightSky,
                                              ),
                                            ),
                                            value: e,
                                          );
                                        }).toList(),
                                        onTap: null,
                                        onChanged: (val) {
                                          setState(() {
                                            province = val.toString();
                                            city = null;
                                            barangay = null;
                                          });
                                          dataController.clearCityData();
                                          dataController.clearBarangayData();
                                          dataController.getCities(province!);
                                        },
                                        value: province,
                                      ),
                                    )
                                  : const SizedBox(),
                          province != null
                              ? Container(
                                  margin: EdgeInsets.only(
                                    top: 15 / mockUpHeight * size.height,
                                  ),
                                  child: DropdownButtonFormField2(
                                    isExpanded: true,
                                    dropdownMaxHeight:
                                        200 / mockUpHeight * size.height,
                                    offset: Offset(
                                        0, 10.0 / mockUpHeight * size.height),
                                    decoration: InputDecoration(
                                      hintText: "Select City",
                                      hintStyle:
                                          veripolTextStyles.bodyLarge.copyWith(
                                        color: veripolColors.nightSky
                                            .withOpacity(0.50),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          4 / mockUpWidth * size.width,
                                        ),
                                        borderSide: BorderSide(
                                          color: veripolColors.nightSky,
                                          width: 5 / mockUpWidth * size.width,
                                        ),
                                      ),
                                    ),
                                    items: dataController.cities.map((e) {
                                      return DropdownMenuItem(
                                        child: Text(
                                          e,
                                          textScaleFactor: textScale,
                                          maxLines: 2,
                                          style: veripolTextStyles.bodyLarge
                                              .copyWith(
                                            color: veripolColors.nightSky,
                                          ),
                                        ),
                                        value: e,
                                      );
                                    }).toList(),
                                    onTap: null,
                                    onChanged: (val) {
                                      setState(() {
                                        city = val.toString();

                                        barangay = null;
                                      });
                                      dataController.clearBarangayData();
                                      dataController.getBarangays(city!);
                                    },
                                    value: city,
                                  ),
                                )
                              : const SizedBox(),
                          city != null
                              ? Container(
                                  margin: EdgeInsets.only(
                                    top: 15 / mockUpHeight * size.height,
                                  ),
                                  child: DropdownButtonFormField2(
                                    isExpanded: true,
                                    dropdownMaxHeight:
                                        200 / mockUpHeight * size.height,
                                    offset: Offset(
                                        0, 10.0 / mockUpHeight * size.height),
                                    decoration: InputDecoration(
                                      hintText: "Select Barangay",
                                      hintStyle:
                                          veripolTextStyles.bodyLarge.copyWith(
                                        color: veripolColors.nightSky
                                            .withOpacity(0.50),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          4 / mockUpWidth * size.width,
                                        ),
                                        borderSide: BorderSide(
                                          color: veripolColors.nightSky,
                                          width: 5 / mockUpWidth * size.width,
                                        ),
                                      ),
                                    ),
                                    items: dataController.barangays.map((e) {
                                      return DropdownMenuItem(
                                        child: Text(
                                          e,
                                          textScaleFactor: textScale,
                                          maxLines: 2,
                                          style: veripolTextStyles.bodyLarge
                                              .copyWith(
                                            color: veripolColors.nightSky,
                                          ),
                                        ),
                                        value: e,
                                      );
                                    }).toList(),
                                    onTap: null,
                                    onChanged: (val) {
                                      setState(() {
                                        barangay = val.toString();
                                      });
                                    },
                                    value: barangay,
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 56 / mockUpHeight * size.height,
                    left: 19 / mockUpWidth * size.width,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back),
                      iconSize: 30 / mockUpWidth * size.width,
                      color: Colors.black,
                    ),
                  ),
                  Positioned(
                    top: 600 / mockUpHeight * size.height,
                    left: 10 / mockUpWidth * size.width,
                    width: 355 / mockUpWidth * size.width,
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed:
                              region == null || city == null || barangay == null
                                  ? null
                                  : () async {
                                      setLoading(true);
                                      bool temp = false;
                                      await dataController
                                          .storeLocationDataToDB(
                                        region,
                                        province ?? "",
                                        city,
                                        barangay,
                                        "",
                                      )
                                          .whenComplete(() async {
                                        await dataController.cacheLocationData(
                                          region ?? "",
                                          province ?? "",
                                          city ?? "",
                                          barangay ?? "",
                                          "",
                                        );
                                      }).whenComplete(() async {
                                        temp = await dataController
                                            .getLocationData()
                                            .whenComplete(() {
                                          dataController.updateLocationData(
                                            region ?? "",
                                            province ?? "",
                                            city ?? "",
                                            "",
                                          );
                                        });
                                      });

                                      await myCandidatesDataController
                                          .setNationalCandidates()
                                          .whenComplete(() async {
                                        await myCandidatesDataController
                                            .setProvincialCount()
                                            .whenComplete(() async {
                                          await myCandidatesDataController
                                              .setMunicipalCount()
                                              .whenComplete(() async {
                                            myCandidatesDataController
                                                .setTotalCandidateCount();
                                            await myCandidatesDataController
                                                .storeCandidateCountToDB()
                                                .whenComplete(() {
                                              if (temp) {
                                                Navigator.pop(context);
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const CandidateTypeSelection(),
                                                  ),
                                                );
                                              }
                                            });
                                          });
                                        });
                                      });
                                    },
                          style: ElevatedButton.styleFrom(
                            primary: veripolColors.nightSky,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: SizedBox(
                            height: 60 / mockUpHeight * size.height,
                            child: Center(
                              child: SizedBox(
                                width: 58 / mockUpWidth * size.width,
                                child: FittedBox(
                                  child: Text(
                                    "Let's Go!",
                                    style: veripolTextStyles.labelLarge
                                        .copyWith(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15 / mockUpHeight * size.height,
                        ),
                        GestureDetector(
                          onTap: () {
                            dataController
                                .getProvinces("Region VII (Central Visayas)");
                            dataController.getCities("Cebu");
                            dataController.getBarangays("City of Lapu-Lapu");
                            setState(() {
                              region = "Region VII (Central Visayas)";
                              province = "Cebu";
                              city = "City of Lapu-Lapu";
                            });
                          },
                          child: SizedBox(
                            height: 60 / mockUpHeight * size.height,
                            child: Center(
                              child: Text(
                                "I'm from Lapu-Lapu City",
                                textScaleFactor: textScale,
                                style: veripolTextStyles.labelLarge.copyWith(
                                  color: const Color(0xff141B2C),
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
            ),
          );
  }
}
