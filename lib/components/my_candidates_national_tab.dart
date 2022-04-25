import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veripol/components/my_candidate_add_button.dart';
import 'package:veripol/controller/my_candidate_data_controller.dart';

import 'themes.dart';

class MyCandidatesNationalTab extends StatefulWidget {
  const MyCandidatesNationalTab({
    Key? key,
    required this.textScale,
    required this.screenSize,
  }) : super(key: key);

  final double textScale;
  final Size screenSize;
  @override
  State<MyCandidatesNationalTab> createState() =>
      _MyCandidatesNationalTabState();
}

class _MyCandidatesNationalTabState extends State<MyCandidatesNationalTab> {
  List<Widget> houseOfRepsWidgets = [];

  @override
  void initState() {
    buildHouseOfRep();
    super.initState();
  }

  void buildHouseOfRep() {
    List<String> houseOfRepDistricts =
        MyCandidatesDataController().houseOfRepDistricts;
    Map<String, Widget> houseOfReps = {};
    for (var district in houseOfRepDistricts) {
      houseOfReps.addAll({
        district: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              district,
              textAlign: TextAlign.center,
              textScaleFactor: widget.textScale,
              style: veripolTextStyles.labelLarge.copyWith(
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10 / mockUpHeight * widget.screenSize.height,
            ),
            InkWell(
              onTap: () {},
              child: const MyCandidateAddButton(),
            ),
          ],
        ),
      });
    }

    for (var district in houseOfRepDistricts) {
      setState(() {
        houseOfRepsWidgets.add(houseOfReps[district]!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final myCandidatesController =
        Provider.of<MyCandidatesDataController>(context);
    final textScale = size.width / mockUpWidth;
    return ListView(
      padding: EdgeInsets.symmetric(
        vertical: 20 / mockUpHeight * size.height,
        horizontal: 10 / mockUpWidth * size.width,
      ),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "President",
                  textScaleFactor: textScale,
                  style: veripolTextStyles.labelLarge.copyWith(
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10 / mockUpHeight * size.height,
                ),
                InkWell(
                  onTap: () {},
                  child: const MyCandidateAddButton(),
                ),
              ],
            ),
            SizedBox(
              width: 15 / mockUpWidth * size.width,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Vice President",
                  textScaleFactor: textScale,
                  style: veripolTextStyles.labelLarge.copyWith(
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10 / mockUpHeight * size.height,
                ),
                InkWell(
                  onTap: () {},
                  child: const MyCandidateAddButton(),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 20 / mockUpHeight * size.height,
        ),
        SizedBox(
          width: size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Senators",
                textScaleFactor: textScale,
                style: veripolTextStyles.labelLarge.copyWith(
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: 5 / mockUpWidth * size.width,
              ),
              Expanded(
                child: Divider(
                  height: 20 / mockUpHeight * size.height,
                  thickness: 1 / mockUpHeight * size.height,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10 / mockUpHeight * size.height,
        ),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 15 / mockUpWidth * size.width,
          runSpacing: 10 / mockUpHeight * size.height,
          children: List.generate(12, (index) {
            return InkWell(
              onTap: () {},
              child: const MyCandidateAddButton(),
            );
          }),
        ),
        SizedBox(
          height: 20 / mockUpHeight * size.height,
        ),
        myCandidatesController.houseOfRep == 1
            ? Column(
                children: [
                  SizedBox(
                    width: size.width,
                    child: Divider(
                      height: 20 / mockUpHeight * size.height,
                      thickness: 1 / mockUpHeight * size.height,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "House of\nRepresentatives",
                            textAlign: TextAlign.center,
                            textScaleFactor: textScale,
                            style: veripolTextStyles.labelLarge.copyWith(
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 10 / mockUpHeight * size.height,
                          ),
                          InkWell(
                            onTap: () {},
                            child: const MyCandidateAddButton(),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15 / mockUpWidth * size.width,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Party List",
                            textScaleFactor: textScale,
                            style: veripolTextStyles.labelLarge.copyWith(
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 20 / mockUpHeight * size.height,
                          ),
                          InkWell(
                            onTap: () {},
                            child: const MyCandidateAddButton(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )
            : Column(
                children: [
                  SizedBox(
                    width: size.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "House Of Representatives",
                          textScaleFactor: textScale,
                          style: veripolTextStyles.labelLarge.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 5 / mockUpWidth * size.width,
                        ),
                        Expanded(
                          child: Divider(
                            height: 20 / mockUpHeight * size.height,
                            thickness: 1 / mockUpHeight * size.height,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10 / mockUpHeight * size.height,
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 15 / mockUpWidth * size.width,
                    runSpacing: 10 / mockUpHeight * size.height,
                    children: houseOfRepsWidgets,
                  ),
                  SizedBox(
                    height: 20 / mockUpHeight * size.height,
                  ),
                  SizedBox(
                    width: size.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Party List",
                          textScaleFactor: textScale,
                          style: veripolTextStyles.labelLarge.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 5 / mockUpWidth * size.width,
                        ),
                        Expanded(
                          child: Divider(
                            height: 20 / mockUpHeight * size.height,
                            thickness: 1 / mockUpHeight * size.height,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10 / mockUpHeight * size.height,
                  ),
                  InkWell(
                    onTap: () {},
                    child: const MyCandidateAddButton(),
                  ),
                  SizedBox(
                    height: 20 / mockUpHeight * size.height,
                  ),
                ],
              ),
      ],
    );
  }
}
