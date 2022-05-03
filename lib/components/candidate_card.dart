import 'package:flutter/material.dart';

import '../models/models.dart';
import '../views/profile/board_councilors_profile.dart';
import '../views/profile/governor_vice_profile.dart';
import '../views/profile/house_of_reps.dart';
import '../views/profile/mayor_vice_profile.dart';
import '../views/profile/party_list_profile.dart';
import '../views/profile/pres_vice_profile.dart';
import '../views/profile/senators_profile.dart';
import 'themes.dart';

class CandidateCard extends StatelessWidget {
  const CandidateCard({
    Key? key,
    required this.data,
    this.index,
  }) : super(key: key);

  final CandidateData data;
  final int? index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScale = size.width / mockUpWidth;
    return InkWell(
      onTap: () {
        switch (data.filedCandidacies["May 9, 2022"]["position"]) {
          case "PRESIDENT":
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PresidentViceCandidateProfile(data: data),
              ),
            );
            break;
          case "VICE-PRESIDENT":
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PresidentViceCandidateProfile(data: data),
              ),
            );
            break;
          case "SENATOR":
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SenatorsProfile(
                  data: data,
                  index: index,
                ),
              ),
            );
            break;
          case "MEMBER, HOUSE OF REPRESENTATIVES":
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HouseOfRepresentativesProfile(
                  position: "House of Representative",
                  data: data,
                ),
              ),
            );
            break;
          case "PARTY LIST":
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PartyListProfile(
                  data: data,
                  description: "",
                ),
              ),
            );
            break;
          case "PROVINCIAL GOVERNOR":
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GovernorViceProfile(
                  position: "Governor",
                  data: data,
                ),
              ),
            );
            break;
          case "PROVINCIAL VICE-GOVERNOR":
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GovernorViceProfile(
                  position: "Vice Governor",
                  data: data,
                ),
              ),
            );
            break;
          case "MEMBER, SANGGUNIANG PANLALAWIGAN":
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProvincialBoardCouncilorsProfile(
                  position: "Provincial Board",
                  index: index,
                  data: data,
                ),
              ),
            );
            break;
          case "MAYOR":
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    MayorViceProfile(data: data, position: "Mayor"),
              ),
            );
            break;
          case "VICE-MAYOR":
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    MayorViceProfile(data: data, position: "Vice Mayor"),
              ),
            );
            break;
          case "COUNCILOR":
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProvincialBoardCouncilorsProfile(
                  index: index,
                  position: "Councilor",
                  data: data,
                ),
              ),
            );
            break;
        }
      },
      child: Container(
        width: 350 / mockUpWidth * size.width,
        decoration: BoxDecoration(
          color: const Color(0xff141414),
          borderRadius: BorderRadius.circular(5 / mockUpWidth * size.height),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 8 / mockUpWidth * size.width,
          vertical: 10 / mockUpHeight * size.height,
        ),
        margin: EdgeInsets.only(bottom: 10 / mockUpHeight * size.height),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 80 / mockUpWidth * size.width,
              height: 80 / mockUpWidth * size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    data.imgURL == "" ? "assets/default_img.png" : data.imgURL,
                  ),
                ),
                borderRadius:
                    BorderRadius.circular(7 / mockUpWidth * size.height),
              ),
            ),
            SizedBox(
              width: 10 / mockUpWidth * size.width,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "#" +
                      data.filedCandidacies["May 9, 2022"]["ballot_number"]
                          .toString(),
                  textScaleFactor: textScale,
                  style: veripolTextStyles.titleSmall.copyWith(
                    color: Colors.white,
                    height: 1,
                  ),
                ),
                SizedBox(
                  width: 240 / mockUpWidth * size.width,
                  child: Text(
                    data.filedCandidacies["May 9, 2022"]["ballot_name"]
                        .toString()
                        .split("(")
                        .first,
                    textScaleFactor: textScale,
                    maxLines: 2,
                    style: veripolTextStyles.titleMedium.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5 / mockUpHeight * size.height,
                ),
                Visibility(
                  visible: data.filedCandidacies["May 9, 2022"]
                                  ["political_party"] ==
                              null ||
                          data.filedCandidacies["May 9, 2022"]
                                  ["political_party"] ==
                              ""
                      ? false
                      : true,
                  child: SizedBox(
                    width: 240 / mockUpWidth * size.width,
                    child: Text(
                      data.filedCandidacies["May 9, 2022"]["political_party"] ??
                          "",
                      maxLines: 2,
                      textScaleFactor: textScale,
                      style: veripolTextStyles.labelMedium.copyWith(
                        color: Colors.white.withOpacity(0.50),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
