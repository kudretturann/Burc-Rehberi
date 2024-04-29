import 'package:burc_proje/burc_item.dart';
import 'package:burc_proje/data/strings.dart';
import 'package:burc_proje/modeller/burc.dart';
import 'package:flutter/material.dart';

class BurcListesi extends StatelessWidget {
  late List<Burc> tumBurclar;
  BurcListesi() {
    tumBurclar = veriKaynaginiHazirla();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Burçlar Listesi'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return BurcItem(listelenenBurc: tumBurclar[index]);
          },
          itemCount: tumBurclar.length,
        ),
      ),
    );
  }

  List<Burc> veriKaynaginiHazirla() {
    List<Burc> gecici = [];
    for (int i = 0; i < 12; i++) {
      var burcAdi = Strings.BURC_ADLARI[i];
      var burcTarihi = Strings.BURC_TARIHLERI[i];
      var burcDetay = Strings.BURC_GENEL_OZELLIKLERI[i];
      var burcKucukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + '${i + 1}.png';
      var burcBuyukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + '_buyuk' + '${i + 1}.png';
      Burc eklenecekBurc =
          Burc(burcAdi, burcTarihi, burcDetay, burcKucukResim, burcBuyukResim);
      gecici.add(eklenecekBurc);
    }
    return gecici;
  }
}
