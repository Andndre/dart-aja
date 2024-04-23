import 'dart:io';
import 'barang.dart';

List<BarangDijual> barang = [
  BarangDijual(
    nama: 'Ayam Geprek',
    jumlah: 12,
    hargaBeli: 10000,
    hargaJual: 12000,
  ),
  BarangDijual(
    nama: 'Be Guling',
    jumlah: 12,
    hargaBeli: 14000,
    hargaJual: 20000,
  ),
  BarangDijual(
    nama: 'Nasi Goreng',
    jumlah: 12,
    hargaBeli: 10000,
    hargaJual: 12000,
  ),
  BarangDijual(
    nama: 'Jasjus',
    jumlah: 40,
    hargaBeli: 500,
    hargaJual: 2000,
  ),
];

var transaksi = <Barang>[];
var keuntungan = 0;

int viewOption() {
  while (true) {
    print('OPSI YANG BISA DIPILIH:');
    print('1. QUIT');
    print('2. Cek List Barang');
    print('3. Transaksi Baru');
    print('4. Riwayat Transaksi');
    print('5. Analisis Untung/Rugi');

    try {
      var input = int.parse(stdin.readLineSync()!);
      if (input >= 1 && input <= 5) {
        return input;
      }
    } catch (e) {}
    print('Inputan yang anda masukkan salah!');
  }
}

listBarang(List<BarangDijual> list) {
  print('NO\tID\t | NAMA\t | JUMLAH\t | HARGA BELI\t | HARGA JUAL');
  for (var i = 0; i < list.length; i++) {
    print(
        '[${i + 1}]\t${list[i].id}\t | ${list[i].nama}\t | ${list[i].jumlah}\t | ${list[i].hargaBeli}\t | ${list[i].hargaJual}');
  }
}

transaksiBaru() {
  print('Silahkan pilih beberapa barang berikut untuk dibeli');
  listBarang(barang);
  while (true) {
    print('Pilih [nomor] barang yang ingin dibeli:');
    late int input;
    try {
      input = int.parse(stdin.readLineSync()!);
      if (input <= 0 || input > barang.length) {
        print('Inputan yang anda masukkan salah!');
        continue;
      }
    } catch (e) {
      print('Inputan yang anda masukkan salah!');
      continue;
    }
    var b = barang[input - 1];
    print('Berapa banyak ${b.nama} yang ingin dibeli?');
    late int jumlah;
    try {
      jumlah = int.parse(stdin.readLineSync()!);
      if (jumlah > b.jumlah) {
        print('Barang tidak cukup!');
        continue;
      }
    } catch (e) {
      print('Barang tidak cukup!');
      continue;
    }
    transaksi.add(Barang(
      id: b.id,
      nama: b.nama,
      jumlah: jumlah,
      hargaBeli: b.hargaBeli * jumlah,
    ));
    var pertambahanKeuntungan = b.hargaJual * jumlah - b.hargaBeli * jumlah;
    keuntungan += pertambahanKeuntungan;
    b.jumlah -= jumlah;
    print(
        'Stok barang ${b.nama} berkurang sebanyak $jumlah. Tersisa ${b.jumlah} stok.');
    print('Keuntungan perubahan: $pertambahanKeuntungan');
    print('Transaksi Sukses...');
    break;
  }
}

riwayaTransaksi() {
  print('NO\tID\t | NAMA\t | JUMLAH\t | HARGA JUAL');
  for (var i = 0; i < transaksi.length; i++) {
    print(
        '[${i + 1}]\t${transaksi[i].id}\t | ${transaksi[i].nama}\t | ${transaksi[i].jumlah}\t | ${transaksi[i].hargaBeli}');
  }
}

main() {
  print('Halo, selamat datang di warung Pak Wayan!');
  while (true) {
    print('Silahkan pilih beberapa barang berikut untuk dibeli');
    var input = viewOption();
    // QUIT
    if (input == 1) {
      break;
    } else if (input == 2) {
      print('Cek List Barang');
      listBarang(barang);
      print('Tekan sembarang tombol untuk melanjutkan...');
      stdin.readLineSync();
    } else if (input == 3) {
      print('Transaksi Baru');
      transaksiBaru();
      print('Tekan sembarang tombol untuk melanjutkan...');
      stdin.readLineSync();
    } else if (input == 4) {
      print('Riwayat Transaksi');
      riwayaTransaksi();
      print('Tekan sembarang tombol untuk melanjutkan...');
      stdin.readLineSync();
    } else if (input == 5) {
      print('Analisis Untung/Rugi');
      print('Keuntungan: $keuntungan');
      print('Tekan sembarang tombol untuk melanjutkan...');
      stdin.readLineSync();
    } else {
      print('Input salah !');
    }
  }
}
