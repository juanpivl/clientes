import 'package:flutter/material.dart';
import 'package:pacientes/screens/screen.dart';
import 'package:pacientes/widgets/widgets.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Background(),
            Column(children: [
              PageTitle(title: 'Bienvenidos', text: 'Nutricion para todos'),
              SizedBox(height: 20.0),
              dependeDia(),
              SizedBox(height: 15.0),
              Expanded(
                  child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xfff9e79f),
                ),
                child: _diadieta(),
              )),
              SizedBox(height: 30.0),
            ])
          ],
        ),
      ),
    );
  }

  CheckboxListTile _buildCheckboxListTile(
    String title,
    bool value,
  ) {
    return CheckboxListTile(
      title: Text(title),
      value: value,
      onChanged: null,
    );
  }
}

class _diadieta extends StatefulWidget {
  const _diadieta({
    Key? key,
  }) : super(key: key);

  @override
  State<_diadieta> createState() => _diadietaState();
}

class _diadietaState extends State<_diadieta> {
  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();

    if (date.weekday == 7) {
      return StreamBuilder<List<DomingoDieta>?>(
        stream: readDomingoDieta(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error ${snapshot.error}');
          } else if (snapshot.hasData) {
            return ListView(
              children: snapshot.data!.map(buildDomingo).toList(),
            );
          } else {
            return Loading();
          }
        },
      );
    } else {
      if (date.weekday == 6) {
        return StreamBuilder<List<SabadoDieta>?>(
          stream: readSabadoDieta(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error ${snapshot.error}');
            } else if (snapshot.hasData) {
              return ListView(
                children: snapshot.data!.map(buildSabado).toList(),
              );
            } else {
              return Loading();
            }
          },
        );
      } else if (date.weekday == 5) {
        return StreamBuilder<List<ViernesDieta>?>(
          stream: readViernesDieta(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error ${snapshot.error}');
            } else if (snapshot.hasData) {
              return ListView(
                children: snapshot.data!.map(buildViernes).toList(),
              );
            } else {
              return Loading();
            }
          },
        );
      } else if (date.weekday == 4) {
        return StreamBuilder<List<JuevesDieta>?>(
          stream: readJuevesDieta(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error ${snapshot.error}');
            } else if (snapshot.hasData) {
              return ListView(
                children: snapshot.data!.map(buildJueves).toList(),
              );
            } else {
              return Loading();
            }
          },
        );
      } else if (date.weekday == 3) {
        return StreamBuilder<List<MiercolesDieta>?>(
          stream: readMiercolesDieta(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error ${snapshot.error}');
            } else if (snapshot.hasData) {
              return ListView(
                children: snapshot.data!.map(buildMiercoles).toList(),
              );
            } else {
              return Loading();
            }
          },
        );
      } else if (date.weekday == 2) {
        return StreamBuilder<List<MartesDieta>?>(
          stream: readMartesDieta(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error ${snapshot.error}');
            } else if (snapshot.hasData) {
              return ListView(
                children: snapshot.data!.map(buildMartes).toList(),
              );
            } else {
              return Loading();
            }
          },
        );
      } else if (date.weekday == 1) {
        return StreamBuilder<List<LunesDieta>?>(
          stream: readLunesDieta(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error ${snapshot.error}');
            } else if (snapshot.hasData) {
              return ListView(
                children: snapshot.data!.map(buildLunes).toList(),
              );
            } else {
              return Loading();
            }
          },
        );
      } else {
        return SingleCard(
          dia: 'Ni puta idea que dia es',
          nav: 'domingo',
          foto: 'assets/fondo.jpg',
        );
      }
    }
  }
}

class dependeDia extends StatefulWidget {
  @override
  State<dependeDia> createState() => _dependeDiaState();
}

class _dependeDiaState extends State<dependeDia> {
  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();

    if (date.weekday == 7) {
      return SingleCard(
        dia: 'Domingo',
        nav: 'domingo',
        foto: 'assets/fondo.jpg',
      );
    } else {
      if (date.weekday == 6) {
        return SingleCard(
          dia: 'Sabado',
          nav: 'sabado',
          foto: 'assets/fondo.1.jpg',
        );
      } else if (date.weekday == 5) {
        return SingleCard(
          dia: 'Viernes',
          nav: 'viernes',
          foto: 'assets/fondo.2.jpg',
        );
      } else if (date.weekday == 4) {
        return SingleCard(
          dia: 'Jueves',
          nav: 'jueves',
          foto: 'assets/fondo.3.jpg',
        );
      } else if (date.weekday == 3) {
        return SingleCard(
          dia: 'Miercoles',
          nav: 'miercoles',
          foto: 'assets/fondo.4.jpg',
        );
      } else if (date.weekday == 2) {
        return SingleCard(
          dia: 'Martes',
          nav: 'martes',
          foto: 'assets/fondo.5.jpg',
        );
      } else if (date.weekday == 1) {
        return SingleCard(
          dia: 'Martes',
          nav: 'Martes',
          foto: 'assets/fondo.6.jpg',
        );
      } else {
        return SingleCard(
          dia: 'Ni puta idea que dia es',
          nav: 'domingo',
          foto: 'assets/fondo.jpg',
        );
      }
    }
  }
}
