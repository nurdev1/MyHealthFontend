import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



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
              flex:10,
              child: Container(
                width: double.infinity,
                height: SizeConfig.screenHeight,
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeaderDasboard(),

                      SizedBox(height: SizeConfig.blockSizeVertical! * 4,),
                      SizedBox(
                        width: SizeConfig.screenHeight,
                        child: Wrap(
                          runSpacing: 20.0,
                          spacing: 20.0,
                          alignment: WrapAlignment.spaceBetween,
                          children: [
                            InfoMedecin(),
                            InfoHopitalDansboard(),
                            InfoPatientDasboard(),
                            InfoSpecialiteDasboard(),
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
                                    PrimaryText(text: 'Par année',
                                      size: 16,
                                    color: Colors.black45,),
                                    PrimaryText(text: '\Par année',
                                      size: 30,
                                      color: Colors.black,),
                                  ],
                                ),
                                PrimaryText(text: 'Pendant 30 Jours',
                                  size: 30,
                                  color: Colors.black,),
                              ],
                            ),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical! * 4,
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
                                PrimaryText(text: 'Nouveau Médecin ',
                                size: 30,
                                    color: Colors.black87,),
                              PrimaryText(text: 'Traitement Dossier',
                                size: 16,
                                color: Colors.black87,),
                              ],
                            ),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical! * 3,
                            ),
                            MedecinNouveau(),
                            if(!Responsive.isDesktop(context))
                              ListeActiviteRecente(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            if(Responsive.isDesktop(context))
            Expanded(
              flex:4,
              child: Container(
                width: double.infinity,
                height: SizeConfig.screenHeight,
                color: AppColors.secondarBg,
               //pour scroller
                child: SingleChildScrollView(
                  padding:
                  EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
                  child: Column(
                    children: [
                      DetailDasboard(), ListeActiviteRecente(),],
                  ),
                )
              ),
            )
          ],
        ),
      )
    );
  }
}




