import 'package:flutter/material.dart';

class Engin_and_MethodePay extends StatefulWidget {
  @override
  _Engin_and_MethodePayState createState() => _Engin_and_MethodePayState();
}

class _Engin_and_MethodePayState extends State<Engin_and_MethodePay> {
  String selectedVehicle = '';
  String selectedButton = ''; // Ajout de la variable selectedButton

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Motos'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: OutlinedButton(
              onPressed: () {
                setState(() {
                  selectedVehicle = 'Moto';
                });
              },
              style: ButtonStyle(
                side: MaterialStateProperty.all<BorderSide>(
                  BorderSide(
                    color: selectedVehicle == 'Moto' ? Colors.black : Colors.transparent,
                  ),
                ),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/image.png',
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(width: 10),
                        Text('Moto'),
                      ],
                    ),
                    Text('Prix'),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: OutlinedButton(
              onPressed: () {
                setState(() {
                  selectedVehicle = 'Tricycle';
                });
              },
              style: ButtonStyle(
                side: MaterialStateProperty.all<BorderSide>(
                  BorderSide(
                    color: selectedVehicle == 'Tricycle' ? Colors.black : Colors.transparent,
                  ),
                ),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/image.png',
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(width: 10),
                        Text('Tricycle'),
                      ],
                    ),
                    Text('Prix'),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: OutlinedButton(
              onPressed: () {
                setState(() {
                  selectedVehicle = 'Camion';
                });
              },
              style: ButtonStyle(
                side: MaterialStateProperty.all<BorderSide>(
                  BorderSide(
                    color: selectedVehicle == 'Camion' ? Colors.black : Colors.transparent,
                  ),
                ),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/image.png',
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(width: 10),
                        Text('Camion'),
                      ],
                    ),
                    Text('Prix'),
                  ],
                ),
              ),
            ),
          ),
          
          // Nouvelle rangée de boutons personnalisés
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                buttonText: 'without card 1',
                isSelected: selectedButton == 'without card 1',
                onPressed: () {
                  setState(() {
                    selectedButton = 'without card 1';
                  });
                },
              ),
              SizedBox(width: 20),
              CustomButton(
                buttonText: 'without card 2',
                isSelected: selectedButton == 'without card 2',
                onPressed: () {
                  setState(() {
                    selectedButton = 'without card 2';
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Définition du widget CustomButton
class CustomButton extends StatelessWidget {
  final String buttonText;
  final bool isSelected;
  final VoidCallback onPressed;

  const CustomButton({
    required this.buttonText,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.blue,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: isSelected
            ? MaterialStateProperty.all(Colors.blue)
            : MaterialStateProperty.all(Colors.transparent),
      ),
    );
  }
}
