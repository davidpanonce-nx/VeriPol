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
  }) : super(key: key);

  final CandidateData data;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScale = size.width / mockUpWidth;
    return InkWell(
      onTap: () {
        switch (data.filedCandidacies[0]["position"]) {
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
                builder: (context) => SenatorsProfile(data: data),
              ),
            );
            break;
          case "House of Representatives":
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HouseOfRepresentativesProfile(
                    position: "House of Representative"),
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
          case "GOVERNOR":
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const GovernorViceProfile(position: "Governor"),
              ),
            );
            break;
          case "VICE GOVERNOR":
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const GovernorViceProfile(position: "Vice Governor"),
              ),
            );
            break;
          case "PROVINCIAL BOARD":
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProvincialBoardCouncilorsProfile(
                    position: "Provincial Board"),
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
          case "Councilors":
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProvincialBoardCouncilorsProfile(
                    position: "Councilor"),
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
                  "#" + data.filedCandidacies[0]["ballot_number"].toString(),
                  textScaleFactor: textScale,
                  style: veripolTextStyles.titleSmall.copyWith(
                    color: Colors.white,
                    height: 1,
                  ),
                ),
                SizedBox(
                  width: 240 / mockUpWidth * size.width,
                  child: Text(
                    data.filedCandidacies[0]["ballot_name"],
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
                  visible:
                      data.filedCandidacies[0]["political_party"] == null ||
                              data.filedCandidacies[0]["political_party"] == ""
                          ? false
                          : true,
                  child: SizedBox(
                    width: 240 / mockUpWidth * size.width,
                    child: Text(
                      data.filedCandidacies[0]["political_party"] ?? "",
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
