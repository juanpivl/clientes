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
                          hintText: "Contraseña",
                        ),
                        autocorrect: false,
                        obscureText: true,
                        validator: (val) {
                          return (val != null && val.length >= 6)
                              ? null
                              : 'La contraseña debe ser de 6 caracteres';
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
                          hintText: "Confirmar contraseña",
                        ),
                        autocorrect: false,
                        obscureText: true,
                        validator: (val) {
                          return (password == password2)
                              ? null
                              : 'Las contraseñas no coinciden';
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
                  title: Text('Políticas de privacidad'),
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
            text: "El Titular no proporciona una lista de categorías de Datos Personales recogidos. La información completa referente a cada categoría de Datos Personales que se recogen se proporciona en las secciones de la presente política de privacidad dedicadas a tal fin o mediante textos explicativos específicos que se muestran antes de la recogida de dichos Datos.",
          style: TextStyle(color: Colors.black),
          ),),
          RichText(text: TextSpan(
            text: "Los Datos Personales podrán ser proporcionados libremente por el Usuario o, en caso de los Datos de Uso, serán recogidos automáticamente cuando se utilice esta Aplicación.",
 style: TextStyle(color: Colors.black),
          ),),
         
          Text("Modalidades de Tratamiento ",style: TextStyle(fontWeight: FontWeight.bold),),
           RichText(text: TextSpan(text: "El Titular tratará los Datos de los Usuarios de manera adecuada y adoptará las medidas de seguridad apropiadas para impedir el acceso, la revelación, alteración o destrucción no autorizados de los Datos. ", style: TextStyle(color: Colors.black),),),
           RichText(text: TextSpan(text: "El tratamiento de Datos se realizará mediante ordenadores y/o herramientas informáticas, siguiendo procedimientos y modalidades organizativas estrictamente relacionadas con las finalidades señaladas. Además del Titular, en algunos casos podrán acceder a los Datos ciertas categorías depersonas autorizadas, relacionadas con el funcionamiento de esta Aplicación (administración, ventas,marketing, departamento jurídico y de administración de sistemas) o contratistas externos quepresten servicios al Titular (tales como proveedores externos de servicios técnicos, empresas demensajería, empresas de hosting, empresas de informática, agencias de comunicación) que seránnombrados por el Titular como Encargados del Tratamiento, si fuera necesario. Se podrá solicitar alTitular en cualquier momento una lista actualizada de dichas personas. ", style: TextStyle(color: Colors.black),)),
           Text("Base jurídica del Tratamiento",style: TextStyle(fontWeight: FontWeight.bold),),
           RichText(text: TextSpan(text: "El Titular podrá tratar los Datos Personales del Usuario, si se cumple una de las siguientes condiciones: ● Cuando los Usuarios hayan dado su consentimiento para una o más finalidades específicas. Aviso: Al amparo de varias legislaciones diferentes, el Titular podrá estar autorizado a tratar los Datos Personales hasta que el Usuario se oponga a ello (“opción de no participación”), sin necesidad de consentimiento o de cualquier otra base jurídica. Sin embargo, esto no será aplicable cuando el tratamiento de los Datos Personales esté sujeto a la normativa europea en materia de protección de Datos Personales; ● Cuando la obtención de Datos sea necesaria para el cumplimiento de un contrato entre el Usuario y/o cualquier otra obligación precontractual del mismo; ● Cuando el tratamiento sea necesario para el cumplimiento de una obligación legal de obligado cumplimiento por parte del Usuario; ● Cuando el tratamiento esté relacionado con una tarea ejecutada en interés público o en el ejercicio de competencias oficiales otorgadas al Titular; ● Cuando el tratamiento sea necesario con el fin de un interés legítimo perseguido por el Titular o un tercero.", style: TextStyle(color: Colors.black),)),
           Text("Lugar",style: TextStyle(fontWeight: FontWeight.bold),),
           RichText(text: TextSpan(text: "Los Datos se tratan en las oficinas del Titular, así como en cualquier otro lugar en el que se encuentren situadas las partes implicadas en dicho proceso de tratamiento. Dependiendo de la localización de los Usuarios, las transferencias de Datos pueden implicar la transferencia de los Datos de los Usuarios a otro país diferente al suyo propio. Para más información sobre el lugar de tratamiento de dichos Datos transferidos, los Usuarios podrán consultar la sección que contiene los detalles sobre el tratamiento de los Datos Personales.  ", style: TextStyle(color: Colors.black),)),
           RichText(text: TextSpan(text: "Los Usuarios también tendrán derecho a conocer las bases legales de las transferencias de Datos a otro país fuera de la Unión Europea o a cualquier organismo internacional que se rija por el Derecho Público Internacional o que esté formado por dos o más países, como la ONU, y además conocer las medidas de seguridad tomadas por el Titular para salvaguardar sus Datos. ", style: TextStyle(color: Colors.black),)),
           Text("Período de conservación",style: TextStyle(fontWeight: FontWeight.bold),),
           RichText(text: TextSpan(text: "Los Datos Personales serán tratados y conservados durante el tiempo necesario y para la finalidad por la que han sido recogidos. Por lo tanto: ● Los Datos Personales recogidos para la formalización de un contrato entre el Titular y el Usuario deberán conservarse como tales hasta en tanto dicho contrato se haya formalizado por completo. ● Los Datos Personales recogidos en legítimo interés del Titular deberán conservarse durante el tiempo necesario para cumplir con dicha finalidad. Los Usuarios pueden encontrar información específica relacionada con el interés legítimo del Titular consultando las secciones relevantes del presente documento o contactando con el Titular. El Titular podrá conservar los Datos Personales durante un periodo adicional cuando el Usuario preste su consentimiento a tal tratamiento, siempre que dicho consentimiento siga vigente. Además, el Titular estará obligado a conservar Datos Personales durante un periodo adicional siempre que se precise para el cumplimiento de una obligación legal o por orden que proceda de la autoridad. Una vez terminado el período de conservación, los Datos Personales deberán eliminarse. Por lo tanto, los derechos de acceso, modificación, rectificación y portabilidad de datos no podrán ejercerse una vez haya expirado dicho periodo.  ", style: TextStyle(color: Colors.black),)),
           Text("Los derechos de los usuarios",style: TextStyle(fontWeight: FontWeight.bold),),
           RichText(text: TextSpan(text: "Los Usuarios podrán ejercer ciertos derechos con respecto al tratamiento de Datos por parte delTitular.Especialmente, los Usuarios tienen derecho a hacer lo siguiente:● Retirar su consentimiento en cualquier momento. Los Usuarios tienen derecho aretirar su consentimiento cuando lo hubieran concedido con anterioridad para eltratamiento de sus Datos Personales.● Objeción al tratamiento de sus Datos. Los Usuarios tienen derecho a oponerse altratamiento de sus Datos si dicho tratamiento se lleva a cabo con arreglo a una basejurídica distinta del consentimiento. Para más información pueden dirigirse a la seccióncorrespondiente más adelante.● Acceso a sus Datos. Los Usuarios tienen derecho a conocer si sus Datos serántratados por el Titular, a obtener información sobre ciertos aspectos del tratamiento,además de obtener una copia de los Datos objeto del tratamiento.● Verificar y solicitar la modificación. Los Usuarios tienen derecho a verificar laexactitud de sus Datos y solicitar que los mismos se actualicen o corrijan.● Restringir el tratamiento de sus Datos. Los Usuarios tienen derecho, en ciertossupuestos, a restringir el tratamiento de sus Datos. En ese supuesto, el Titularprocesará sus Datos con el único propósito de almacenarlos.● Borrar o eliminar los Datos Personales. Los Usuarios tienen derecho, en ciertossupuestos, a obtener la eliminación de sus Datos por parte del Titular.● Recibir sus Datos y transferirlos a otro responsable. Los Usuarios tienen derecho arecibir sus Datos en un formato estándar, estructurado, mecánicamente legible y, sifuera técnicamente posible, a que se dé traslado de los mismos a otro responsable sinningún impedimento. Esta provisión será de aplicación siempre que los Datos se hayantratado a través de medios automatizados y que el tratamiento se base en elconsentimiento del Usuario, en un contrato del que el Usuario forme parte o queaparezca en las obligaciones precontractuales del mismo.● Poner una reclamación. Los Usuarios tienen derecho a poner una reclamación ante laautoridad competente en materia de protección de datos de carácter personal. ", style: TextStyle(color: Colors.black),)), 
           Text("Detalles sobre el derecho de oposición al tratamiento",style: TextStyle(fontWeight: FontWeight.bold),),
           RichText(text: TextSpan(text:"Cuando el tratamiento de los Datos Personales sea de interés público, en el ejercicio de competencias oficiales otorgadas al Titular o con motivo de un interés legítimo del Titular, los Usuarios podrán oponerse a dicho tratamiento explicando un motivo con relación a su situación particular para justificar su objeción. Los Usuarios deben saber que, sin embargo, en caso de que sus Datos Personales sean tratados con fines comerciales, pueden oponerse en cualquier momento a tal tratamiento sin necesidad de justificación. Para saber si los Datos Personales de los Usuarios están siendo tratados por parte del Titular para fines comerciales, éstos deberán consultar las secciones relevantes del presente documento.  ", style: TextStyle(color: Colors.black), )),
        ],
    );
  }
}
