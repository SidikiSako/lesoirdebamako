import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class SubscribePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 20.0),
        child: Column(
          children: <Widget>[
            Container(
              //width: 150,
              height: 400,
              //color: Colors.red,
              child: Image.asset(
                "assets/images/lesoirfacebook.png",
                //fit: BoxFit.fill,
              ),
            ),
            Text(
              "Votre journal est aussi sur Facebook",
              style: GoogleFonts.rubik(
                  color: Color(0xFF0802AE),
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600),
            ),
            RaisedButton(
              child: Text(
                "Suivez-nous sur Facebook",
                style: GoogleFonts.rubik(
                  color: Colors.white,
                  fontSize: 15.0,
                ),
              ),
              onPressed: launchFaceBookApp,
              color: Color(0xFF0802AE),
            ),
            SizedBox(height: 20.0),
            Container(
              width: double.infinity,
              child: Image.asset("assets/images/subscribe.png"),
            ),
            SizedBox(height: 20.0),
            Container(
              width: double.infinity,
              child: Image.asset("assets/images/contact.png"),
            ),
          ],
        ),
      ),
    );
  }

  void launchFaceBookApp() async {
    String fbProtocolUrl;
    if (Platform.isIOS) {
      //on est sur IOS. Le format est le même pour pour les pages ou compte perso
      //id page lesoiredebamako = 112802470279703
      fbProtocolUrl = "fb://profile/112802470279703";
    } else {
      //on est sur android
      fbProtocolUrl = "fb://page/112802470279703";
      //si on voulait ouvrir un profile personnel sur android
      //le format serait fb://profile/112802470279703
    }
    String fallbackUrl = "https://www.facebook.com/LeSoirdeBamako";
    try {
      //on essaye de lancer l'application Facebook sur l'appareil
      bool launched = await launch(fbProtocolUrl, forceSafariVC: false);
      if (launched == false) {
        //l'application facebook est présente sur le devise mais on n'a pas pu
        //ouvrir facebook
        await launch(fallbackUrl, forceSafariVC: false);
      }
    } catch (e) {
      //dans ce cas l'application est introuvable sur le device ou il y a eu
      //un problème. Alors on ouvre le navigateur internet
      await launch(fallbackUrl, forceSafariVC: false);
    }
  }
}
