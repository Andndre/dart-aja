class Barang {
  int id;
  String nama;
  int hargaBeli;
  int jumlah;

  Barang({
    required this.id,
    required this.nama,
    required this.hargaBeli,
    required this.jumlah,
  });
}

class BarangDijual extends Barang {
  static int idCurrent = 0;
  int hargaJual;
  BarangDijual({
    required String nama,
    required int hargaBeli,
    required int jumlah,
    required this.hargaJual,
  }) : super(
          id: ++idCurrent,
          nama: nama,
          hargaBeli: hargaBeli,
          jumlah: jumlah,
        );
}
