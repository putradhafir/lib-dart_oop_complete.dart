// ============================================================
// PROGRAM OOP DART - GABUNGAN 8 KONSEP + 1 BONUS
// ============================================================
// 🔗 LINK DARTPAD: https://dartpad.dev/?id=29f8a7b3c1e5d9f4a2b6c8e0d3f7a1b4
// 
// DIBUAT DARI 8 LINK DARTPAD:
// 1. Mobil     → https://dartpad.dev/e908a6a83b306bbe2f8b1079e42bfb5c
// 2. Warna     → https://dartpad.dev/d81fff001b77f587e93eb98a921c298c
// 3. Titik     → https://dartpad.dev/86f78050833aaa772135ea7d61ed3d7b
// 4. PersonPrivate → https://dartpad.dev/744995155054ab7621d93ba1d760ac0a
// 5. PersonGetter → https://dartpad.dev/c9c91aa0b784c3f453bf265fdd79e526
// 6. PersonSetter → https://dartpad.dev/bca5fcf54c618fba3e62cbb77745b36c
// 7. Produk    → https://dartpad.dev/d98df96f1c5f946938474951eebe44b1
// 8. User      → https://dartpad.dev/89ee243f7ce3f56bc39f2c69d5d06e6a
// ============================================================

import 'dart:convert';

// ============================================================
// 1. CLASS MOBIL - Constructor (Default, Named, dari JSON)
// ============================================================
class Mobil {
  String? merk;
  int? tahun;

  // Constructor default
  Mobil(this.merk, this.tahun);

  // Named constructor
  Mobil.baru() {
    merk = 'Toyota';
    tahun = 2023;
  }

  // Named constructor dari JSON
  Mobil.dariJson(Map<String, dynamic> json) {
    merk = json['merk'];
    tahun = json['tahun'];
  }

  @override
  String toString() => 'Mobil{merk: $merk, tahun: $tahun}';
}

// ============================================================
// 2. CLASS WARNA - Const Constructor
// ============================================================
class Warna {
  final int r, g, b;
  const Warna(this.r, this.g, this.b);

  @override
  String toString() => 'Warna(r: $r, g: $g, b: $b)';
}

// ============================================================
// 3. CLASS TITIK - Initializer List
// ============================================================
class Titik {
  final double x, y;

  Titik(double x, double y)
      : x = x.abs(),
        y = y.abs() {
    print('📍 Titik dibuat di (${this.x}, ${this.y})');
  }
}

// ============================================================
// 4. CLASS PERSON - Private Field
// ============================================================
class PersonPrivate {
  String _name;  // private field
  int age;

  PersonPrivate(this._name, this.age);

  // Getter untuk mengakses _name
  String get name => _name;
}

// ============================================================
// 5. CLASS PERSON - Getter (Method vs Syntax)
// ============================================================
class PersonGetter {
  String _name;
  int age;

  PersonGetter(this._name, this.age);

  // Getter method
  String getName() => _name;

  // Getter syntax
  String get getName1 => _name;
}

// ============================================================
// 6. CLASS PERSON - Setter (Method vs Syntax)
// ============================================================
class PersonSetter {
  String _name;
  int age;

  PersonSetter(this._name, this.age);

  // Setter method
  void setName(String name) => _name = name;

  // Setter syntax
  set setName1(String name) => _name = name;

  // Getter untuk melihat hasil
  String get getName => _name;
}

// ============================================================
// 7. CLASS PRODUK - Validasi dengan Getter & Setter
// ============================================================
class Produk {
  String _nama;
  double _harga;

  Produk(this._nama, this._harga);

  // Getter
  String get nama => _nama;
  double get harga => _harga;

  // Setter dengan validasi
  set nama(String value) {
    if (value.length >= 3) {
      _nama = value;
    } else {
      print('❌ Gagal: Nama produk minimal 3 karakter');
    }
  }

  set harga(double value) {
    if (value > 0) {
      _harga = value;
    } else {
      print('❌ Gagal: Harga harus lebih dari 0');
    }
  }
}

// ============================================================
// 8. CLASS USER - Login & Ganti Password
// ============================================================
class User {
  String _username;
  String _password;

  User(this._username, this._password);

  // Getter
  String get username => _username;

  // Method login
  bool login(String username, String password) {
    return _username == username && _password == password;
  }

  // Method ganti password dengan validasi
  void gantiPassword(String lama, String baru) {
    if (_password == lama) {
      if (baru.length >= 8) {
        _password = baru;
        print('✅ Password berhasil diubah');
      } else {
        print('❌ Gagal: Password baru minimal 8 karakter');
      }
    } else {
      print('❌ Gagal: Password lama salah');
    }
  }
}

// ============================================================
// 9. BONUS: CLASS REKENING BANK - Latihan dari soal
// ============================================================
class RekeningBank {
  String _nomorRekening;
  double _saldo;

  RekeningBank(this._nomorRekening, [double saldoAwal = 0]) 
      : _saldo = saldoAwal >= 0 ? saldoAwal : 0;

  void deposit(double jumlah) {
    if (jumlah > 0) {
      _saldo += jumlah;
      print('✅ Deposit Rp ${jumlah.toStringAsFixed(0)} berhasil');
    } else {
      print('❌ Jumlah deposit harus > 0');
    }
    cekSaldo();
  }

  void tarik(double jumlah) {
    if (jumlah > 0) {
      if (_saldo >= jumlah) {
        _saldo -= jumlah;
        print('✅ Penarikan Rp ${jumlah.toStringAsFixed(0)} berhasil');
      } else {
        print('❌ Saldo tidak cukup (Rp ${_saldo.toStringAsFixed(0)})');
      }
    } else {
      print('❌ Jumlah penarikan harus > 0');
    }
    cekSaldo();
  }

  void cekSaldo() {
    print('💰 Saldo: Rp ${_saldo.toStringAsFixed(0)}');
    print('------------------------');
  }
}

// ============================================================
// FUNGSI UNTUK MENJALANKAN SEMUA DEMO
// ============================================================
void runAllDemos() {
  print('\n' + '=' * 60);
  print('📚 PROGRAM OOP DART - GABUNGAN 8 KONSEP + BONUS');
  print('=' * 60);
  print('🔗 Original Links:');
  print('1. https://dartpad.dev/e908a6a83b306bbe2f8b1079e42bfb5c');
  print('2. https://dartpad.dev/d81fff001b77f587e93eb98a921c298c');
  print('3. https://dartpad.dev/86f78050833aaa772135ea7d61ed3d7b');
  print('4. https://dartpad.dev/744995155054ab7621d93ba1d760ac0a');
  print('5. https://dartpad.dev/c9c91aa0b784c3f453bf265fdd79e526');
  print('6. https://dartpad.dev/bca5fcf54c618fba3e62cbb77745b36c');
  print('7. https://dartpad.dev/d98df96f1c5f946938474951eebe44b1');
  print('8. https://dartpad.dev/89ee243f7ce3f56bc39f2c69d5d06e6a');
  print('=' * 60);

  // DEMO 1: MOBIL
  print('\n🔹 DEMO 1: CLASS MOBIL');
  print('-' * 40);
  var m1 = Mobil('Honda', 2020);
  var m2 = Mobil.baru();
  var m3 = Mobil.dariJson({'merk': 'Suzuki', 'tahun': 2021});
  print('Default: $m1');
  print('Named .baru: $m2');
  print('From JSON: $m3');

  // DEMO 2: WARNA
  print('\n🔹 DEMO 2: CLASS WARNA');
  print('-' * 40);
  const merah = Warna(255, 0, 0);
  const merahLagi = Warna(255, 0, 0);
  print('Warna 1: $merah');
  print('Warna 2: $merahLagi');
  print('Instance sama? ${identical(merah, merahLagi)}');

  // DEMO 3: TITIK
  print('\n🔹 DEMO 3: CLASS TITIK');
  print('-' * 40);
  var t1 = Titik(3.0, 4.0);
  var t2 = Titik(-5.0, 10.0);
  print('Titik 1: (${t1.x}, ${t1.y})');
  print('Titik 2: (${t2.x}, ${t2.y})');

  // DEMO 4: PERSON PRIVATE
  print('\n🔹 DEMO 4: CLASS PERSON (PRIVATE FIELD)');
  print('-' * 40);
  var p1 = PersonPrivate("Salma", 20);
  print('Nama: ${p1.name} (via getter)');
  print('Usia: ${p1.age}');

  // DEMO 5: PERSON GETTER
  print('\n🔹 DEMO 5: CLASS PERSON (GETTER)');
  print('-' * 40);
  var p2 = PersonGetter("Salma", 20);
  print('Via method: ${p2.getName()}');
  print('Via syntax: ${p2.getName1}');

  // DEMO 6: PERSON SETTER
  print('\n🔹 DEMO 6: CLASS PERSON (SETTER)');
  print('-' * 40);
  var p3 = PersonSetter("Salma", 20);
  print('Awal: ${p3.getName}');
  p3.setName('Aqila');
  print('Via method: ${p3.getName}');
  p3.setName1 = 'Nabila';
  print('Via syntax: ${p3.getName}');

  // DEMO 7: PRODUK
  print('\n🔹 DEMO 7: CLASS PRODUK');
  print('-' * 40);
  var produk = Produk('Monitor Samsung', 3500.0);
  print('Awal: ${produk.nama} - Rp${produk.harga}');
  produk.nama = 'Keyboard Mekanik';
  produk.harga = 1200.0;
  print('Update valid: ${produk.nama} - Rp${produk.harga}');
  print('\nMencoba update invalid:');
  produk.nama = 'TV';  // < 3 karakter
  produk.harga = -100.0;  // < 0
  print('Hasil akhir: ${produk.nama} - Rp${produk.harga}');

  // DEMO 8: USER
  print('\n🔹 DEMO 8: CLASS USER');
  print('-' * 40);
  var user = User('admin_user', 'securePass123');
  print('Username: ${user.username}');
  print('Login sukses: ${user.login('admin_user', 'securePass123')}');
  print('Login gagal: ${user.login('admin_user', 'wrongPass')}');
  user.gantiPassword('securePass123', 'newPass456');
  print('Login dgn password baru: ${user.login('admin_user', 'newPass456')}');

  // DEMO 9: BONUS REKENING BANK
  print('\n🔹 DEMO 9: BONUS - REKENING BANK');
  print('-' * 40);
  var bank = RekeningBank('123-456-789', 500000);
  print('Saldo awal:');
  bank.cekSaldo();
  bank.deposit(200000);
  bank.tarik(100000);
  bank.tarik(700000);  // Gagal

  print('\n' + '=' * 60);
  print('✅ SEMUA DEMO SELESAI');
  print('=' * 60);
}

// ============================================================
// MAIN FUNCTION
// ============================================================
void main() {
  runAllDemos();
}
