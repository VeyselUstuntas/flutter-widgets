import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  var tfController = TextEditingController();
  String? alinanVeri = null;
  String? resimUrl = "baklava.png";
  bool switchKontrol = false;
  bool checkBoxKontrol = false;
  int radioDeger = 0;
  bool progressKontrol = false;
  double ilerleme = 30.0;
  var ulkelerListesi= <String>[];
  String secilenUlke = "Türkiye";


  @override
  void initState() {
    super.initState();
    ulkelerListesi.add("Türkiye");
    ulkelerListesi.add("İtalya");
    ulkelerListesi.add("Japonya");
    print("veyseş");
  }


  var tfDate = TextEditingController();
  var tfTime = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widgets Kullanımı"),
        backgroundColor: Colors.white10,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(
                "Alınan Veri: ${alinanVeri}",
                style: TextStyle(fontSize: 24),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12),
                child: TextField(
                  controller: tfController,
                  style: const TextStyle(fontSize: 23),
                  decoration: const InputDecoration(
                      hintText: "Veri Girin", hintStyle: TextStyle(fontSize: 16)),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      alinanVeri = tfController.text;
                    });
                  },
                  child: Text(
                    "Veriyi Al",
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
        
        
              //images
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Image.asset("resimler/mutlu.png"),
                  //Image.asset("resimler/uzgun.png")
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          resimUrl = "ayran.png";
                        });
                      },
                      child: Text("Resim1")),
                  SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.network(
                          "http://kasimadalan.pe.hu/yemekler/resimler/${resimUrl}")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          resimUrl = "kofte.png";
                        });
                      },
                      child: Text("Resim2")),
                ],
              ),
        
        
              //switch and checkbox
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 200,
                    child: SwitchListTile(
                        value: switchKontrol,
                        title: Text("deneme switch"),
                        activeColor: Colors.blueAccent  ,
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (value) {
                          setState(() {
                            switchKontrol = value;
                          });
                        },),
                  ),
                  SizedBox(width: 200,
                    child: CheckboxListTile(
                      value: checkBoxKontrol,
                      title: Text("deneme checkbox"),
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (veri) {
                        setState(() {
                          checkBoxKontrol = veri!;
                        });
                      },),
                  )
                ],
              ),
        
              //Radio
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 200,
                    child: RadioListTile(
                      title: Text("RealMadrid"),
                      value: 1,
                      groupValue: radioDeger,
                      onChanged: (value) {
                        setState(() {
                          radioDeger = value!;
                        });
                      },),
                  ),
                  SizedBox(width: 200,
                    child: RadioListTile(
                        title: Text("Barcelona"),
                        value: 2,
                        groupValue: radioDeger,
                        onChanged: (value) {
                          setState(() {
                            radioDeger = value!;
                          });
                        },),
                  ),
                ],
              ),
        
              //durum göster
              ElevatedButton(
                  onPressed: (){
                    setState(() {
                      showDialog(context: context, builder: (BuildContext context){
                        return AlertDialog(
                          title: Text("Switch ve ChecBox  VE RADİO Durumları"),
                          content: Text("Switch: ${switchKontrol}\nCheckBox: ${checkBoxKontrol}\nRadioButton: $radioDeger\nSeçilen Son Ülke: ${secilenUlke}"),
                          actions: [
                            TextButton(onPressed: (){Navigator.pop(context);}, child: Text("Tamam")),
                          ],
                        );
                      });
                    });
                  },
                  child: Text("Durumlarını Göster", style: TextStyle(color: Colors.black),),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),),
        
              //progress bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          progressKontrol = true;
                        });
                      },
                      child: Text("Başla")),
                  SizedBox(
                      width: 50,
                      height: 50,
                    child: Visibility(visible: progressKontrol,child: CircularProgressIndicator()) ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          progressKontrol = false;
                        });
                      },
                      child: Text("Dur")),
                ],
              ),
              
              //slideBar
              Text(ilerleme.toString()),
              Slider(
                max:100.0,
                min: 0.0,
                value: ilerleme,
                onChanged: (value) {
                  setState(() {
                    String deger = value.toStringAsFixed(0);
                    ilerleme = double.parse(deger);
        
                  });
                },),
        
              //date time picker
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 100,
                    child: TextField(controller: tfDate, decoration: InputDecoration(hintText: "DATE",),),
                  ),
                  IconButton(
                      onPressed: (){
                        showDatePicker(
                            context: context,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2030),
                            initialDate: DateTime.now())
                              .then((value){
                                tfDate.text = "${value!.day}/${value.month}/${value.year}";
                        });
                      },
                      icon: Icon(Icons.date_range,)),
                  SizedBox(width: 100,
                    child: TextField(controller: tfTime, decoration: InputDecoration(hintText: "TIME",),),
                  ),
                  IconButton(
                      onPressed: (){
                        showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now()))
                            .then((value){
                              tfTime.text = "${value!.hour} : ${value!.minute}";
                        });
                      },
                      icon: Icon(Icons.access_time,)),
                ],
              ),
        
              //dropDownMenu
              DropdownButton(
                  value: secilenUlke,
                  icon: Icon(Icons.arrow_drop_down),
                  items: ulkelerListesi.map((ulke) {
                    return DropdownMenuItem(value: ulke,child: Text(ulke),);
                  }).toList(),
                  onChanged: (veri){
                    setState(() {
                      secilenUlke = veri!;
                    });
                  }),
        
        
              // scrollView ve GestureDetector yapısı
              GestureDetector(
                  onTap: () {
                    print("Tek Tıklandı");
                  },
                  onDoubleTap: (){
                    print("Çift Tıklandı");
                  },
                  onLongPress: (){
                    print("Uzun Basıldı");
                  },
                  child: Container(width: 100, height: 50,color: Colors.red,)),
        
            ],
          ),
        ),
      ),
    );
  }
}
