
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  List<String> _superPowers = [
    "Invisibilidad",
    "Rayos x",
    "Super Fuerza",
    "Rapidez"
  ];
  String _name = "";
  String _email = "";
  String _password = "";
  String _date = "";
  String _superPower = "Invisibilidad";
  TextEditingController _inputFieldDateController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inputs"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: <Widget>[
          _createInput(),
          Divider(),
          _createEmailInput(),
          Divider(),
          _createPasswordInput(),
          Divider(),
          _createDateInput(context),
          Divider(),
          _createDropdow(),
          Divider(),
          _createPerson()
        ],
      ),
    );
  }

  Widget _createInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          counter: Text("Letras ${_name.length}"),
          hintText: "Nombre de la persona",
          labelText: "Name",
          helperText: "Solo ingresa el nombre",
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_box)),
      onChanged: (value) {
        setState(() {
          _name = value;
        });
      },
      //autofocus: true,
    );
  }

  Widget _createEmailInput() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          counter: Text("Letras ${_name.length}"),
          hintText: "Email",
          labelText: "Email",
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email)),
      onChanged: (value) => setState(() {
        _email = value;
      }),
      //autofocus: true,
    );
  }

  Widget _createPasswordInput() {
    return TextField(
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          counter: Text("Letras ${_name.length}"),
          hintText: "Ingrese su contraseña",
          labelText: "Contraseña",
          suffixIcon: Icon(Icons.vpn_key),
          icon: Icon(Icons.vpn_key)),
      onChanged: (value) => setState(() {
        _password = value;
      }),
      //autofocus: true,
    );
  }

  Widget _createDateInput(BuildContext context) {
    return TextField(
      controller: _inputFieldDateController,
      enableInteractiveSelection: false,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          counter: Text("Letras ${_name.length}"),
          hintText: "Fecha",
          labelText: "Fecha",
          suffixIcon: Icon(Icons.date_range),
          icon: Icon(Icons.date_range)),
      onTap: () {
        //remove focus
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDate(context);
      },

      //autofocus: true,
    );
  }

  Widget _createPerson() {
    return ListTile(
      leading: Icon(Icons.person),
      title: Text(_name),
      subtitle: Column(
        children: <Widget>[Text(_email), Text(_password)],
      ),
    );
  }

  _selectDate(BuildContext context) async {

    DateTime date = await showCupertinoModalPopup(

        context: context, builder: (context){
      final cupTamePicker = CupertinoDatePicker(

        onDateTimeChanged: (time){

      },);
      return cupTamePicker;
    });
    if (date != null) {
      setState(() {
        _date = date.toString();
        _inputFieldDateController.text = _date;
      });
    }
    return
    _getDropDown(context);

    DateTime picker = await showDatePicker(

        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2018),
        lastDate: DateTime(2025),
        locale: Locale("es"));
    if (picker != null) {
      setState(() {
        _date = picker.toString();
        _inputFieldDateController.text = _date;
      });
    }
  }

  void _getDropDown(BuildContext context) {}
  Widget _createDropdow() {
    return DropdownButton(
      isExpanded: true,
      value: _superPower,
      hint: Text("Selecciona un poder"),
      items: getDropdownOptions(),
      onChanged: (option) {
        print(option);
        setState(() {
            _superPower = option;
        });
      },
    );
  }

  List<DropdownMenuItem<String>> getDropdownOptions() {
      List<DropdownMenuItem<String>> list = [];
      _superPowers.forEach((superPower){
        list.add(DropdownMenuItem(
          child: Text(superPower),
          value: superPower,
        ));
      });
      return list;
  }
}
