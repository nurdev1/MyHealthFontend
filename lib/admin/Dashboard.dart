import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';



import '../config/responsive.dart';
import '../config/size_config.dart';
import '../style/colors.dart';
import '../style/style.dart';
import 'component/ActionDashboard.dart';
import 'component/CourbeDashboard.dart';
import 'component/DetailDasboard.dart';
import 'component/InfoHopitalDansboard.dart';
import 'component/InfoMedecinDasboard.dart';
import 'component/InfoPatientDasboard.dart';
import 'component/InfoSpecialiteDashboard.dart';
import 'component/ListeActivite.dart';
import 'component/MedecinActiveDashboard.dart';
import 'component/MenuAdmin.dart';
import 'component/headerDashboard.dart';


class Dashboard extends StatelessWidget {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor:Colors.white,
      key: _drawerKey,
      drawer: SizedBox(width: 100, child: Menu(),),
        appBar: !Responsive.isDesktop(context)
            ? AppBar(
          elevation: 0,
          backgroundColor: AppColors.white,
          leading: IconButton(
              onPressed: () {
                _drawerKey.currentState?.openDrawer();
              },
              icon: Icon(Icons.menu, color: AppColors.black)),
          actions: [
            ActionDashboard(),
          ],
        )
            : PreferredSize(
          preferredSize: Size.zero,
          child: SizedBox(),
        ),

      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(Responsive.isDesktop(context))
            Expanded(
                flex:2,
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(67),
                    ),
                    child: Menu())
            ),
            Expanded(
                flex: 10,
                child: SafeArea(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeaderDasboard(),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 4,
                        ),
                        SizedBox(
                          width: SizeConfig.screenWidth,
                          child: Wrap(
                            spacing: 20,
                            runSpacing: 20,
                            alignment: WrapAlignment.spaceBetween,
                            children: [
                              InfoHopitalDansboard(),
                              InfoMedecin(),
                              InfoPatientDasboard(),
                              InfoSpecialiteDasboard()
                            ],
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PrimaryText(
                                  text: 'Utilisation',
                                  size: 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.secondary,
                                ),
                                /*PrimaryText(
                                    text: '\$1500',
                                    size: 30,
                                    fontWeight: FontWeight.w800),*/
                              ],
                            ),
                            PrimaryText(
                              text: 'Pendant 30 jours',
                              size: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.secondary,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 3,
                        ),
                        Container(
                          height: 180,
                          child: BarchartComponent(),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PrimaryText(
                                text: 'Historique',
                                size: 30,
                                fontWeight: FontWeight.w800),
                            PrimaryText(
                              text: 'Nouveau medécin',
                              size: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.secondary,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 3,
                        ),
                        MedecinNouveau(),
                        if (!Responsive.isDesktop(context)) ListeActiviteRecente(),
                      ],
                    ),
                  ),
                )),

            if(Responsive.isDesktop(context))
            Expanded(
              flex: 4,
              child: SafeArea(
                child: Container(
                  width: double.infinity,
                  height: SizeConfig.screenHeight,
                  decoration: BoxDecoration(color: HexColor('#54DEFC').withOpacity(0.9)),
                  child: SingleChildScrollView(
                    padding:
                    EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                    child: Column(
                      children: [
                        ActionDashboard(),
                        DetailDasboard(),
                        ListeActiviteRecente(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}




