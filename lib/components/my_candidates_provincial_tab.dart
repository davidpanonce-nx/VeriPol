import 'package:flutter/material.dart';
import 'package:veripol/controller/my_candidate_data_controller.dart';

import 'my_candidate_add_button.dart';
import 'themes.dart';

class MyCandidatesProvincialTab extends StatefulWidget {
  const MyCandidatesProvincialTab({
    Key? key,
    required this.textScale,
    required this.screenSize,
  }) : super(key: key);

  final double textScale;
  final Size screenSize;
  @override
  State<MyCandidatesProvincialTab> createState() =>
      _MyCandidatesProvincialTabState();
}

class _MyCandidatesProvincialTabState extends State<MyCandidatesProvincialTab> {
  List<Widget> provincialBoardWidgets = [];

  @override
  void initState() {
    super.initState();
  }

  void buildProvincialBoard() {
    List<String> provincialBoardDistricts =
        MyCandidatesDataController().provincialBoardDistricts;
    for (var district in provincialBoardDistricts) {
      setState(() {
        provincialBoardWidgets.add(
          Column(
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
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
                  "Governor",
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
                  "Vice Governor",
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
                "Provincial Board",
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
          children: provincialBoardWidgets,
        ),
      ],
    );
  }
}
