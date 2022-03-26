import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:veripol/candidates/candidates_list.dart';
import 'package:veripol/components/themes.dart';
import 'package:veripol/views/registration%20location/registered_voter.dart';

import '../controller/data_controller.dart';

class VeripolCandidatesWrapper extends StatefulWidget {
  const VeripolCandidatesWrapper({
    Key? key,
    required this.size,
    required this.scale,
    required this.textScale,
  }) : super(key: key);
  final Size size;
  final double scale;
  final double textScale;
  @override
  State<VeripolCandidatesWrapper> createState() =>
      _VeripolCandidatesWrapperState();
}

class _VeripolCandidatesWrapperState extends State<VeripolCandidatesWrapper> {
  @override
  Widget build(BuildContext context) {
    final dataController = Provider.of<DataController>(context);
    return SizedBox(
      width: widget.size.width,
      height: widget.size.height,
      child: Stack(
        children: [
          SizedBox(
            width: widget.size.width,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.black),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xffCB3B39),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            child: Image.asset(
              "assets/bg_pattern.png",
              scale: widget.scale,
            ),
          ),
          Positioned(
            top: 202 / mockUpHeight * widget.size.height,
            left: 92 / mockUpWidth * widget.size.width,
            child: InkWell(
              onTap: () {
                dataController.hasLocationData
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CandidatesList(),
                        ),
                      )
                    : Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const RegisteredVoterSelection(),
                        ),
                      );
              },
              child: Text(
                "Candidates of 2022",
                style: GoogleFonts.notoSans(
                  textStyle: const TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 20.26,
                    fontWeight: FontWeight.w700,
                    height: 1.27,
                    letterSpacing: 0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 524 / mockUpHeight * widget.size.height,
            left: 112.5 / mockUpWidth * widget.size.width,
            child: InkWell(
              onTap: () {},
              child: Text(
                "My Candidates",
                style: GoogleFonts.notoSans(
                  textStyle: const TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 20.26,
                    fontWeight: FontWeight.w700,
                    height: 1.27,
                    letterSpacing: 0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
