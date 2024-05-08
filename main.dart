import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';

const _credensials = r''' 
  {
    "type": "service_account",
    "project_id": "mad-project-419407",
    "private_key_id": "1fd6cf7840bff58bbc7b236b389ade603c14d80f",
    "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCWlNEuj+C9jeAT\n6hkLGa5bln4YdOMOYGc+vjbCYiKV8pyvgT5IuyrnglGomfvJw/V7VQKnRPOdH+P3\nk7/yjQN4pDE4Xkl+bh9wesf3px03BSMZGr0JeVLnlZlnGHu9zXiQh8zsgXFUKsry\ndtycQ8bS0E9aTS++Htja9LCVvJWM5nv/7pwEl8UphjSMXZGOV/DT7B6ns/O60UUN\n5frle8pbWkZcuXUMI3kJRt1NMyWYWUCBSrBYmUk9Jic/BZDEIKYa1nkmjnI2UTBe\nlVoheaCTLUkXDJigv3GPj+vnoYxWcF//IvtibOESqhw+372++yifWUiFY31PpuZk\nmLwVrfgJAgMBAAECggEAMOUs0Xo9pz9o6f6DWEPkBnBlDIrz6YirLcf1HwRfp6IK\nd8C3WUWRZnA+FMm/ZSJA1WXiwS7WDgi7bPpogxl/7Y4fP2b6ZVfb1JnB0exNQ77i\nyTWR+YAQSAufLsdX8udDxWabR5a2lnZ4xOeMth8Z8f1bLv7OSGVa1CpNJqoAQ6pZ\n+ENKpKbFQVaiBCO/5nU1OSZq0SwhQRrpGT60m0LLYuwTuafXsPha02x6+04T0kAu\nxe9TIcfeAN9cVxeqL83/wM+ywsyqDUlZtrtnMC9yego2OZRogAsfGOwIfcA64swm\nYz+vkjKLql3OwCee4P63Ol5qPgeAKKM3n0G04CqwywKBgQDSwzrcrDtr9Y9ttT8q\nHBnpgXWWb8gIbde7cbWeGaAUizSO36d6M2J1fRla9a60d7Dkko0Wa8sXDS+/mP1i\n+Mgw7Y6j5Z1NUGWUsSRJlJ06k93S105VgpMT1cNIwkoJb+qXCqxp9KX1W9K1XpFH\np4DYO32UXkVMB/UAL48Q7zbKBwKBgQC25s5oFnZrCrcUqez3mMW9kz9uFrInKHlx\nHZb47nBnFmbZrKc8P7jwNNHa9LW+lueKDzU2cwvBTYugOalYPFz68Dxqdxna0DCQ\nGQv3nIWn2TpSh27jfl46WHuX935fNrmMBOzPouMdPe+x0n9yOo/BI2afV4jxT1p2\nreWq9ZTpbwKBgBQWMzfw2kDxyFemXHzA7N9KTVCnGqNjBJqCvdJxksYidkHfovCM\nkSetYos+uwXMGnnOVc/7OgHaaeCSziNunnW7TkrkiVdjACtprpGsrkd07EE57+dK\naIYNa201xySbG/qFM+VtQZvewngyqRnxJuB02wUW7vfOElWQMsxkYA5lAoGAJyCR\nH2tOwe904xLHAuDHzJpng2GPkxjxgeVWmsJHgYYlUoPA8v6ezaQ/EJwxFSirN7mx\nJIjQBvZT3F75f0rKiVRDWHNKMKlA+lKhYMM3RIUQGP+oFTq/ZbPwHL5xZmUKpI2Z\nK4IpG+RYFq51XTZx8ltkZMoRHa5gJ+tjqoMG7DkCgYB0ICrPW5dPeJ6jFbN7Nmm7\nMeNBOQz0TjO8u9HxXKrOyYeFiE5Rky/8BTJzNd0Otnk0zLXPuSR3X4K8Wref6Y2w\nDEwz7MEhU2nb701ejOKnwALBF+FaHatwN4AjdNOoloXmpRplQ1kk3hk6x9e8mWyQ\n34qagbR86fJ0fJT3GvehSg==\n-----END PRIVATE KEY-----\n",
    "client_email": "invoice-form@mad-project-419407.iam.gserviceaccount.com",
    "client_id": "107520892026109561050",
    "auth_uri": "https://accounts.google.com/o/oauth2/auth",
    "token_uri": "https://oauth2.googleapis.com/token",
    "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
    "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/invoice-form%40mad-project-419407.iam.gserviceaccount.com",
    "universe_domain": "googleapis.com"
  }
''';
  
const _spreadsheetId = '1KoXZT69-TF9_wz4x_mqZFkyQOV1cSpNiAvu9zx7rw-I';
int r=2;

void main() => runApp(InvoiceFormApp());

class InvoiceFormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      title: 'Invoice Form',
      home: InvoiceFormPage(),
    );
  }
}

class InvoiceFormPage extends StatefulWidget {
  @override
  _InvoiceFormPageState createState() => _InvoiceFormPageState();
}

class _InvoiceFormPageState extends State<InvoiceFormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _bNo = '';
  String _partyName = '';
  String _address = '';
  String _gstNumber = '';
  String _particulars = '';
  String _hsnCode = '';
  int _quantity = 0;
  double _rate = 0.0;
  double _amount = 0.0;
  double _igst = 0.0;
  double _cgst = 0.0;
  double _sgst = 0.0;
  double _totalAmount = 0.0;

  void _calculateTotals() {
    _amount = _quantity * _rate;
    _igst = _amount * 0.18; // Assuming 18% IGST
    _cgst = _amount * 0.09; // Assuming 9% CGST
    _sgst = _amount * 0.09; // Assuming 9% SGST
    _totalAmount = _amount + _igst + _cgst + _sgst;
  }

  
  void writeDataToSheet(String _bNo,String _partyName ,String _address,String _gstNumber, String _particulars, String _hsnCode, int _quantity ,double _rate,double _amount,double _igst,double _cgst,double _sgst,double _totalAmount) async {
    
    final gsheets = GSheets(_credensials);
    final ss = await gsheets.spreadsheet(_spreadsheetId);
    final sheet = ss.worksheetByTitle('Sheet1');

    await sheet!.values.insertValue(_bNo, column: 1, row: r);
    await sheet.values.insertValue(_partyName, column: 2, row: r);
    await sheet.values.insertValue(_address, column: 3, row: r);
    await sheet.values.insertValue(_gstNumber, column: 4, row: r);
    await sheet.values.insertValue(_particulars, column: 5, row: r);
    await sheet.values.insertValue(_hsnCode, column: 6, row: r);
    await sheet.values.insertValue(_quantity, column: 7, row: r);
    await sheet.values.insertValue(_rate, column: 8, row: r);
    await sheet.values.insertValue(_amount, column: 9, row: r);
    await sheet.values.insertValue(_igst, column: 10, row: r);
    await sheet.values.insertValue(_cgst, column: 11, row: r);
    await sheet.values.insertValue(_sgst, column: 12, row: r);
    await sheet.values.insertValue(_totalAmount, column: 13, row: r);


  
  }


  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _calculateTotals();
      print('IGST: $_igst');
      print('CGST: $_cgst');
      print('SGST: $_sgst');
      print('Total Amount: $_totalAmount');
      writeDataToSheet( _bNo, _partyName , _address, _gstNumber,  _particulars,  _hsnCode,  _quantity , _rate, _amount, _igst, _cgst, _sgst, _totalAmount);
      r++;
    }
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Invoice Form'),
    ),
    body: Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView( // Wrap the Column with SingleChildScrollView
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'B.No.'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter B.No.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _bNo = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Party Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter party name.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _partyName = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Address'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter address.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _address = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'GST Number'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter GST number.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _gstNumber = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Particulars'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter particulars.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _particulars = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'HSN Code'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter HSNC code.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _hsnCode = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Quantity'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter quantity.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _quantity = int.parse(value!);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Rate'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter rate.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _rate = double.parse(value!);
                },
              ),
              // TextFormField(
              //   decoration: InputDecoration(labelText: 'Amount'),
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return 'Please enter amount.';
              //     }
              //     return null;
              //   },
              //   keyboardType: TextInputType.numberWithOptions(decimal: true),
              //   onSaved: (value) {
              //     _amount = double.parse(value!);
              //   },
              // ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _calculateTotals,
                child: Text('Calculate Totals'),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
}