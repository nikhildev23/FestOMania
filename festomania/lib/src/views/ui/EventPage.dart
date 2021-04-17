import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EventPage extends StatelessWidget {
  final String eventId;
  EventPage(this.eventId);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Events').doc(eventId).snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData) {
            return new CircularProgressIndicator();
          }
          var document = snapshot.data;
          return Scaffold(
            backgroundColor: const Color(0xffedeff8),
            body: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(document["imageLink"]),
                            fit: BoxFit.fill),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(25.0),
                        ),
                      ),
                    ),
                    Text(document["eventName"]),
                    Text(document["collegeName"]),
                    Text("Date:"),
                    Text("Category:"+document["eventCategory"]),
                    Text("About"),
                    Text(document["description"]),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}

const String _svg_9kvwt3 =
    '<svg viewBox="0.0 0.0 52.0 52.0" ><path  d="M 0 0 L 52 0 L 52 52 L 0 52 L 0 0 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_7p1vlt =
    '<svg viewBox="6.5 6.5 37.9 37.9" ><path transform="translate(3.5, 3.5)" d="M 30.08333015441895 26.83333206176758 L 28.37166595458984 26.83333206176758 L 27.76499938964844 26.24833297729492 C 29.88833236694336 23.7783317565918 31.16666603088379 20.57166481018066 31.16666603088379 17.08333206176758 C 31.16666603088379 9.304999351501465 24.86166572570801 3 17.08333206176758 3 C 9.304999351501465 3 3 9.304999351501465 3 17.08333206176758 C 3 24.86166572570801 9.304999351501465 31.16666603088379 17.08333206176758 31.16666603088379 C 20.57166481018066 31.16666603088379 23.7783317565918 29.88833236694336 26.24833297729492 27.76499938964844 L 26.83333206176758 28.37166595458984 L 26.83333206176758 30.08333015441895 L 37.66666793823242 40.89500045776367 L 40.89500045776367 37.66666793823242 L 30.08333015441895 26.83333206176758 Z M 17.08333206176758 26.83333206176758 C 11.68833255767822 26.83333206176758 7.333333492279053 22.47833061218262 7.333333492279053 17.08333206176758 C 7.333333492279053 11.68833255767822 11.68833255767822 7.333333492279053 17.08333206176758 7.333333492279053 C 22.47833061218262 7.333333492279053 26.83333206176758 11.68833255767822 26.83333206176758 17.08333206176758 C 26.83333206176758 22.47833061218262 22.47833061218262 26.83333206176758 17.08333206176758 26.83333206176758 Z" fill="#3f4239" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_i3tzy6 =
    '<svg viewBox="4.3 10.7 36.9 24.0" ><path transform="translate(2.29, 5.71)" d="M 14.8997917175293 28.99958038330078 L 17.49817848205566 26.58248138427734 L 9.058027267456055 18.71404647827148 L 38.85654449462891 18.71404647827148 L 38.85654449462891 15.28553581237793 L 9.058027267456055 15.28553581237793 L 17.5166072845459 7.417099475860596 L 14.8997917175293 4.999999523162842 L 1.999999761581421 16.99979209899902 L 14.8997917175293 28.99958038330078 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_xh7bu1 =
    '<svg viewBox="0.0 0.0 36.0 36.0" ><path  d="M 0 0 L 36 0 L 36 36 L 0 36 L 0 0 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_wuwfgd =
    '<svg viewBox="3.8 3.5 28.4 28.7" ><path transform="translate(1.8, 1.67)" d="M 30.39912796020508 7.353917598724365 L 23.86732864379883 1.859999895095825 L 22.03558540344238 4.037641525268555 L 28.56738090515137 9.531559944152832 L 30.39912796020508 7.353917598724365 Z M 10.34934425354004 4.037641525268555 L 8.53179931640625 1.860000014305115 L 2 7.339685916900635 L 3.831743478775024 9.517326354980469 L 10.34934425354004 4.037641525268555 Z M 16.90954208374023 10.59903144836426 L 14.77960872650146 10.59903144836426 L 14.77960872650146 19.13880157470703 L 21.52439880371094 23.19519233703613 L 22.5893669128418 21.44454002380371 L 16.90954208374023 18.07133102416992 L 16.90954208374023 10.59903144836426 Z M 16.19956207275391 4.905851364135742 C 9.142380714416504 4.905851364135742 3.419956207275391 10.64173126220703 3.419956207275391 17.71550559997559 C 3.419956207275391 24.78927993774414 9.128181457519531 30.52515983581543 16.19956207275391 30.52515983581543 C 23.25674629211426 30.52515983581543 28.97916984558105 24.78927993774414 28.97916984558105 17.71550559997559 C 28.97916984558105 10.64173126220703 23.25674629211426 4.905851364135742 16.19956207275391 4.905851364135742 Z M 16.19956207275391 27.6785717010498 C 10.70433235168457 27.6785717010498 6.259869575500488 23.22365760803223 6.259869575500488 17.71550559997559 C 6.259869575500488 12.20735645294189 10.70433235168457 7.75244140625 16.19956207275391 7.75244140625 C 21.69479751586914 7.75244140625 26.13925933837891 12.20735454559326 26.13925933837891 17.71550559997559 C 26.13925933837891 23.22365760803223 21.69479751586914 27.6785717010498 16.19956207275391 27.6785717010498 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_57e4uv =
    '<svg viewBox="0.0 0.0 42.0 42.0" ><path  d="M 0 0 L 42 0 L 42 42 L 0 42 L 0 0 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_z60tpj =
    '<svg viewBox="3.7 11.7 34.6 18.6" ><path transform="translate(1.72, 4.71)" d="M 5.283766269683838 16.29255104064941 C 5.283766269683838 13.11449813842773 7.686100482940674 10.53116798400879 10.64148998260498 10.53116798400879 L 17.55468368530273 10.53116798400879 L 17.55468368530273 7.000000476837158 L 10.64148998260498 7.000000476837158 C 5.871387481689453 7.000000476837158 2 11.16306304931641 2 16.29255104064941 C 2 21.42204093933105 5.871387481689453 25.58510398864746 10.64148998260498 25.58510398864746 L 17.55468368530273 25.58510398864746 L 17.55468368530273 22.05393409729004 L 10.64148998260498 22.05393409729004 C 7.686100482940674 22.05393409729004 5.283766269683838 19.47060394287109 5.283766269683838 16.29255104064941 Z M 12.36978721618652 18.15106201171875 L 26.1961727142334 18.15106201171875 L 26.1961727142334 14.43404197692871 L 12.36978721618652 14.43404197692871 L 12.36978721618652 18.15106201171875 Z M 27.92447280883789 7.000000476837158 L 21.01128005981445 7.000000476837158 L 21.01128005981445 10.53116798400879 L 27.92447280883789 10.53116798400879 C 30.87985801696777 10.53116798400879 33.28219223022461 13.11449813842773 33.28219223022461 16.29255104064941 C 33.28219223022461 19.47060394287109 30.87986183166504 22.05393409729004 27.92447280883789 22.05393409729004 L 21.01128005981445 22.05393409729004 L 21.01128005981445 25.58510398864746 L 27.92447280883789 25.58510398864746 C 32.69457244873047 25.58510398864746 36.56595993041992 21.42204093933105 36.56595993041992 16.29255104064941 C 36.56595993041992 11.16306304931641 32.69457244873047 7.000000476837158 27.92447280883789 7.000000476837158 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
