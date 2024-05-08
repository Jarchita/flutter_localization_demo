import 'package:flutter/material.dart';
import 'package:flutter_localization_demo/blocs/localization/localization_bloc.dart';
import 'package:flutter_localization_demo/service_locator.dart';

import 'exports/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(AppLocalizations.of(context)?.appTitle ?? ""),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Text(
                  AppLocalizations.of(context)?.lblWelcome ?? "",
                  style: const TextStyle(fontSize: 30, color: Colors.cyan),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 5, bottom: 0, left: 5, right: 5),
              child: _button(
                  AppLocalizations.of(context)?.lblChangeToEnglish ?? "", "en"),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 5, bottom: 15, left: 5, right: 5),
              child: _button(
                  AppLocalizations.of(context)?.lblChangeToGerman ?? "", "de"),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _button(String text, String languageCode) {
    return MaterialButton(
        height: 44,
        shape: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.circular(5),
        ),
        elevation: 0,
        highlightColor: Colors.transparent,
        color: Colors.cyan,
        onPressed: () {
          locator<LocalizationBloc>()
              .add(UpdateLocaleEvent(languageCode: languageCode));
        },
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ));
  }

  void onTapEng() {}
}
