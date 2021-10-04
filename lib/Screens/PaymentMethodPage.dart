import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:rental_application/Views/TextWidget.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
//import 'package:stripe_payment/stripe_payment.dart';

class PaymentMethodPage extends StatefulWidget {

  static final String routeName='/PaymentMethodPageRoute';

  PaymentMethodPage({Key key}) : super(key: key);

  @override
  _PaymentMethodPage createState() => _PaymentMethodPage();
}

class _PaymentMethodPage extends State<PaymentMethodPage> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void initState() {
    border = OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.withOpacity(0.7),
          width: 2.0,
        )
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: AppBarText(text: 'Payment Methods'),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 30,
                  width: 25.0,
                ),
                Padding(padding: const EdgeInsets.only(right: 50.0),
                  child: CreditCardWidget(
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  showBackView: false,
                  obscureCardNumber: true,
                  obscureCardCvv: true,
                  isHolderNameVisible: true,
                  cardBgColor: Colors.grey,
                  onCreditCardWidgetChange: (
                      CreditCardBrand creditCardBrand) {},
                ),
                ),
                 Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          CreditCardForm(
                            formKey: formKey,
                            obscureCvv: true,
                            obscureNumber: true,
                            cardNumber: cardNumber,
                            expiryDate: expiryDate,
                            cardHolderName: cardHolderName,
                            cvvCode: cvvCode,
                            isHolderNameVisible: true,
                            isCardNumberVisible: true,
                            isExpiryDateVisible: true,
                            textColor: Colors.white,
                            themeColor: Colors.blue,
                            cardNumberDecoration: InputDecoration(
                              labelText: 'Number',
                              hintText: 'XXXX XXXX XXXX XXXX',
                              hintStyle: const TextStyle(color: Colors.black),
                              labelStyle: const TextStyle(color: Colors.black),
                              focusedBorder: border,
                              enabledBorder: border,
                            ),
                            expiryDateDecoration: InputDecoration(
                              labelText: 'Expired Date',
                              hintText: 'XX/XX',
                              hintStyle: const TextStyle(color: Colors.black),
                              labelStyle: const TextStyle(color: Colors.black),
                              focusedBorder: border,
                              enabledBorder: border,
                            ),
                            cvvCodeDecoration: InputDecoration(
                              labelText: 'CVV',
                              hintText: 'XXX',
                              hintStyle: const TextStyle(color: Colors.black),
                              labelStyle: const TextStyle(color: Colors.black),
                              focusedBorder: border,
                              enabledBorder: border,
                            ),
                            cardHolderDecoration: InputDecoration(
                              labelText: 'Card Holder',
                              hintStyle: const TextStyle(color: Colors.black),
                              labelStyle: const TextStyle(color: Colors.black),
                              focusedBorder: border,
                              enabledBorder: border,
                            ),
                            onCreditCardModelChange: onCreditCardModelChange,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text(
                                'Glassmorphism',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                              Switch(
                                  value: useGlassMorphism,
                                  activeColor: Colors.white,
                                  activeTrackColor: Colors.green,
                                  onChanged: (bool value) =>
                                      setState(() {
                                        useGlassMorphism = value;
                                      })
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text(
                                'Card Image',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18
                                ),
                              ),
                              Switch(
                                value: useBackgroundImage,
                                inactiveTrackColor: Colors.grey,
                                activeColor: Colors.black,
                                activeTrackColor: Colors.green,
                                onChanged: (bool value) =>
                                    setState(() {
                                      useBackgroundImage = value;
                                    }),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                primary: const Color(0xff1b447b),
                              ),
                              onPressed: () {
                                if (formKey.currentState.validate()) {
                                  print('valid!');
                                }
                                else {
                                  print('invalid!');
                                }
                              },
                              child: Container(
                                margin: const EdgeInsets.all(12),
                                child: const Text('Validate',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'halter',
                                    fontSize: 14,
                                    package: 'flutter_credit_card',
                                  ),
                                ),
                              )
                          )

                        ],
                      ),
                    ))

              ],
            ),
          ),

        )

    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode= creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;

    });
  }
}
