import 'package:flutter/material.dart';
import 'package:pacientes/services/services.dart';
import 'package:pacientes/widgets/widgets.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

 

  //text field state
  String email = '';
  String password = '';
  String password2 = '';
  String error = '';
  bool checkboxValue = false;
  bool checkboxValue2 = false;

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width,
        _screenHeight = MediaQuery.of(context).size.height;
    return loading
        ? Loading()
        : SingleChildScrollView(
            child: Container(
            child: Column(children: [
              const Padding(
                padding: EdgeInsets.all(
                  15.0,
                ),
                child: Text("Registra tu cuenta",
                    style: TextStyle(color: Colors.black, fontSize: 20)),
              ),
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    const SizedBox(height: 30.0),
                    Container(
                      width: 300,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.email,
                            color: Theme.of(context).primaryColor,
                          ),
                          focusColor: Theme.of(context).primaryColor,
                          hintText: "Correo",
                        ),
                        autocorrect: false,
                        validator: (val) {
                          String pattern =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regExp = new RegExp(pattern);

                          return regExp.hasMatch(val ?? '')
                              ? null
                              : 'El correo no es correcto';
                        },
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Container(
                      width: 300,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.password,
                            color: Theme.of(context).primaryColor,
                          ),
                          focusColor: Theme.of(context).primaryColor,
                          hintText: "Contrase??a",
                        ),
                        autocorrect: false,
                        obscureText: true,
                        validator: (val) {
                          return (val != null && val.length >= 6)
                              ? null
                              : 'La contrase??a debe ser de 6 caracteres';
                        },
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Container(
                      width: 300,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.password,
                            color: Theme.of(context).primaryColor,
                          ),
                          focusColor: Theme.of(context).primaryColor,
                          hintText: "Confirmar contrase??a",
                        ),
                        autocorrect: false,
                        obscureText: true,
                        validator: (val) {
                          return (password == password2)
                              ? null
                              : 'Las contrase??as no coinciden';
                        },
                        onChanged: (val) {
                          setState(() {
                            password2 = val;
                          });
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        politicas(context),
                        Checkbox(
                            value: checkboxValue,
                            onChanged: (val) {
                              setState(() {
                                checkboxValue = val!;
                              });
                            }),
                      ],
                    ),
                    const SizedBox(height: 30.0),
                    ElevatedButton(
                      child: Text('Registrar'),
                      onPressed: () async {
                        if (checkboxValue == true) {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              loading = true;
                            });
                            dynamic result =
                                await _auth.registerWithEmail(email, password);
                            if (result == null) {
                              setState(() {
                                error = 'Ingresar un email valido';
                                loading = false;
                              });
                            }
                          }
                        }
                        if (checkboxValue == null) {
                          setState(() {
                            error = 'Acepte los terminos y condiciones';
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
              Center(
                  child: Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14),
              ))
            ]),
          ));
  }

  TextButton politicas(BuildContext context) {
    return TextButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Pol??ticas de privacidad'),
                  content: SingleChildScrollView(
                      child: Container(
                    child: textoPoliticas(),
                      )
                  ),
                );
              });
        },
        child: Text('Politicas de privacidad'));
  }
}

class textoPoliticas extends StatelessWidget {
  const textoPoliticas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Text("Titular y Responsable del tratamiento de los Datos Clases de Datos recogidos ",style: TextStyle(fontWeight: FontWeight.bold),),
          RichText(text: TextSpan(
            text: "El Titular no proporciona una lista de categor??as de Datos Personales recogidos. La informaci??n completa referente a cada categor??a de Datos Personales que se recogen se proporciona en las secciones de la presente pol??tica de privacidad dedicadas a tal fin o mediante textos explicativos espec??ficos que se muestran antes de la recogida de dichos Datos.",
          style: TextStyle(color: Colors.black),
          ),),
          RichText(text: TextSpan(
            text: "Los Datos Personales podr??n ser proporcionados libremente por el Usuario o, en caso de los Datos de Uso, ser??n recogidos autom??ticamente cuando se utilice esta Aplicaci??n.",
 style: TextStyle(color: Colors.black),
          ),),
         
          Text("Modalidades de Tratamiento ",style: TextStyle(fontWeight: FontWeight.bold),),
           RichText(text: TextSpan(text: "El Titular tratar?? los Datos de los Usuarios de manera adecuada y adoptar?? las medidas de seguridad apropiadas para impedir el acceso, la revelaci??n, alteraci??n o destrucci??n no autorizados de los Datos. ", style: TextStyle(color: Colors.black),),),
           RichText(text: TextSpan(text: "El tratamiento de Datos se realizar?? mediante ordenadores y/o herramientas inform??ticas, siguiendo procedimientos y modalidades organizativas estrictamente relacionadas con las finalidades se??aladas. Adem??s del Titular, en algunos casos podr??n acceder a los Datos ciertas categor??as depersonas autorizadas, relacionadas con el funcionamiento de esta Aplicaci??n (administraci??n, ventas,marketing, departamento jur??dico y de administraci??n de sistemas) o contratistas externos quepresten servicios al Titular (tales como proveedores externos de servicios t??cnicos, empresas demensajer??a, empresas de hosting, empresas de inform??tica, agencias de comunicaci??n) que ser??nnombrados por el Titular como Encargados del Tratamiento, si fuera necesario. Se podr?? solicitar alTitular en cualquier momento una lista actualizada de dichas personas. ", style: TextStyle(color: Colors.black),)),
           Text("Base jur??dica del Tratamiento",style: TextStyle(fontWeight: FontWeight.bold),),
           RichText(text: TextSpan(text: "El Titular podr?? tratar los Datos Personales del Usuario, si se cumple una de las siguientes condiciones: ??? Cuando los Usuarios hayan dado su consentimiento para una o m??s finalidades espec??ficas. Aviso: Al amparo de varias legislaciones diferentes, el Titular podr?? estar autorizado a tratar los Datos Personales hasta que el Usuario se oponga a ello (???opci??n de no participaci??n???), sin necesidad de consentimiento o de cualquier otra base jur??dica. Sin embargo, esto no ser?? aplicable cuando el tratamiento de los Datos Personales est?? sujeto a la normativa europea en materia de protecci??n de Datos Personales; ??? Cuando la obtenci??n de Datos sea necesaria para el cumplimiento de un contrato entre el Usuario y/o cualquier otra obligaci??n precontractual del mismo; ??? Cuando el tratamiento sea necesario para el cumplimiento de una obligaci??n legal de obligado cumplimiento por parte del Usuario; ??? Cuando el tratamiento est?? relacionado con una tarea ejecutada en inter??s p??blico o en el ejercicio de competencias oficiales otorgadas al Titular; ??? Cuando el tratamiento sea necesario con el fin de un inter??s leg??timo perseguido por el Titular o un tercero.", style: TextStyle(color: Colors.black),)),
           Text("Lugar",style: TextStyle(fontWeight: FontWeight.bold),),
           RichText(text: TextSpan(text: "Los Datos se tratan en las oficinas del Titular, as?? como en cualquier otro lugar en el que se encuentren situadas las partes implicadas en dicho proceso de tratamiento. Dependiendo de la localizaci??n de los Usuarios, las transferencias de Datos pueden implicar la transferencia de los Datos de los Usuarios a otro pa??s diferente al suyo propio. Para m??s informaci??n sobre el lugar de tratamiento de dichos Datos transferidos, los Usuarios podr??n consultar la secci??n que contiene los detalles sobre el tratamiento de los Datos Personales.  ", style: TextStyle(color: Colors.black),)),
           RichText(text: TextSpan(text: "Los Usuarios tambi??n tendr??n derecho a conocer las bases legales de las transferencias de Datos a otro pa??s fuera de la Uni??n Europea o a cualquier organismo internacional que se rija por el Derecho P??blico Internacional o que est?? formado por dos o m??s pa??ses, como la ONU, y adem??s conocer las medidas de seguridad tomadas por el Titular para salvaguardar sus Datos. ", style: TextStyle(color: Colors.black),)),
           Text("Per??odo de conservaci??n",style: TextStyle(fontWeight: FontWeight.bold),),
           RichText(text: TextSpan(text: "Los Datos Personales ser??n tratados y conservados durante el tiempo necesario y para la finalidad por la que han sido recogidos. Por lo tanto: ??? Los Datos Personales recogidos para la formalizaci??n de un contrato entre el Titular y el Usuario deber??n conservarse como tales hasta en tanto dicho contrato se haya formalizado por completo. ??? Los Datos Personales recogidos en leg??timo inter??s del Titular deber??n conservarse durante el tiempo necesario para cumplir con dicha finalidad. Los Usuarios pueden encontrar informaci??n espec??fica relacionada con el inter??s leg??timo del Titular consultando las secciones relevantes del presente documento o contactando con el Titular. El Titular podr?? conservar los Datos Personales durante un periodo adicional cuando el Usuario preste su consentimiento a tal tratamiento, siempre que dicho consentimiento siga vigente. Adem??s, el Titular estar?? obligado a conservar Datos Personales durante un periodo adicional siempre que se precise para el cumplimiento de una obligaci??n legal o por orden que proceda de la autoridad. Una vez terminado el per??odo de conservaci??n, los Datos Personales deber??n eliminarse. Por lo tanto, los derechos de acceso, modificaci??n, rectificaci??n y portabilidad de datos no podr??n ejercerse una vez haya expirado dicho periodo.  ", style: TextStyle(color: Colors.black),)),
           Text("Los derechos de los usuarios",style: TextStyle(fontWeight: FontWeight.bold),),
           RichText(text: TextSpan(text: "Los Usuarios podr??n ejercer ciertos derechos con respecto al tratamiento de Datos por parte delTitular.Especialmente, los Usuarios tienen derecho a hacer lo siguiente:??? Retirar su consentimiento en cualquier momento. Los Usuarios tienen derecho aretirar su consentimiento cuando lo hubieran concedido con anterioridad para eltratamiento de sus Datos Personales.??? Objeci??n al tratamiento de sus Datos. Los Usuarios tienen derecho a oponerse altratamiento de sus Datos si dicho tratamiento se lleva a cabo con arreglo a una basejur??dica distinta del consentimiento. Para m??s informaci??n pueden dirigirse a la secci??ncorrespondiente m??s adelante.??? Acceso a sus Datos. Los Usuarios tienen derecho a conocer si sus Datos ser??ntratados por el Titular, a obtener informaci??n sobre ciertos aspectos del tratamiento,adem??s de obtener una copia de los Datos objeto del tratamiento.??? Verificar y solicitar la modificaci??n. Los Usuarios tienen derecho a verificar laexactitud de sus Datos y solicitar que los mismos se actualicen o corrijan.??? Restringir el tratamiento de sus Datos. Los Usuarios tienen derecho, en ciertossupuestos, a restringir el tratamiento de sus Datos. En ese supuesto, el Titularprocesar?? sus Datos con el ??nico prop??sito de almacenarlos.??? Borrar o eliminar los Datos Personales. Los Usuarios tienen derecho, en ciertossupuestos, a obtener la eliminaci??n de sus Datos por parte del Titular.??? Recibir sus Datos y transferirlos a otro responsable. Los Usuarios tienen derecho arecibir sus Datos en un formato est??ndar, estructurado, mec??nicamente legible y, sifuera t??cnicamente posible, a que se d?? traslado de los mismos a otro responsable sinning??n impedimento. Esta provisi??n ser?? de aplicaci??n siempre que los Datos se hayantratado a trav??s de medios automatizados y que el tratamiento se base en elconsentimiento del Usuario, en un contrato del que el Usuario forme parte o queaparezca en las obligaciones precontractuales del mismo.??? Poner una reclamaci??n. Los Usuarios tienen derecho a poner una reclamaci??n ante laautoridad competente en materia de protecci??n de datos de car??cter personal. ", style: TextStyle(color: Colors.black),)), 
           Text("Detalles sobre el derecho de oposici??n al tratamiento",style: TextStyle(fontWeight: FontWeight.bold),),
           RichText(text: TextSpan(text:"Cuando el tratamiento de los Datos Personales sea de inter??s p??blico, en el ejercicio de competencias oficiales otorgadas al Titular o con motivo de un inter??s leg??timo del Titular, los Usuarios podr??n oponerse a dicho tratamiento explicando un motivo con relaci??n a su situaci??n particular para justificar su objeci??n. Los Usuarios deben saber que, sin embargo, en caso de que sus Datos Personales sean tratados con fines comerciales, pueden oponerse en cualquier momento a tal tratamiento sin necesidad de justificaci??n. Para saber si los Datos Personales de los Usuarios est??n siendo tratados por parte del Titular para fines comerciales, ??stos deber??n consultar las secciones relevantes del presente documento.  ", style: TextStyle(color: Colors.black), )),
        ],
    );
  }
}
