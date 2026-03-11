import 'dart:convert';

// ============================================================
// 1. CLASS MOBIL - Constructor (Default, Named, dari JSON)
// ============================================================
class Mobil {
  String? merk;
  int? tahun;

  Mobil(this.merk, this.tahun);

  Mobil.baru() {
    merk = 'Toyota';
    tahun = 2023;
  }

  Mobil.dariJson(Map<String, dynamic> json) {
    merk = json['merk'];
    tahun = json['tahun'];
  }

  @override
  String toString() => 'Mobil{merk: $merk, tahun: $tahun}';
}

// ============================================================
// 2. CLASS WARNA - Const Constructor (Immutable Object)
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
    print('Titik dibuat di (${this.x}, ${this.y})');
  }
}

// ============================================================
// 4. CLASS PERSON - Private Field
// ============================================================
class PersonPrivate {
  String _name;
  int age;
  PersonPrivate(this._name, this.age);
  
  String get name => _name; // Getter untuk akses field private
}

// ============================================================
// 5. CLASS PERSON - Getter (Method vs Syntax)
// ============================================================
class PersonGetter {
  String _name;
  int age;
  PersonGetter(this._name, this.age);

  String get getName1 => _name;      // Getter syntax
  String getName() => _name;          // Getter method
}

// ============================================================
// 6. CLASS PERSON - Setter (Method vs Syntax)
// ============================================================
class PersonSetter {
  String _name;
  int age;
  PersonSetter(this._name, this.age);

  set setName1(String name) => _name = name;  // Setter syntax
  void setName(String name) => _name = name;   // Setter method
  String get getName => _name;
}

// ============================================================
// 7. CLASS PRODUK - Getter & Setter dengan Validasi
// ============================================================
class Produk {
  String _nama;
  double _harga;

  Produk(this._nama, this._harga);

  String get nama => _nama;
  double get harga => _harga;

  set nama(String value) {
    if (value.length >= 3) {
      _nama = value;
    } else {
      print('❌ Gagal: Nama harus minimal 3 karakter.');
    }
  }

  set harga(double value) {
    if (value > 0) {
      _harga = value;
    } else {
      print('❌ Gagal: Harga harus > 0.');
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

  String get username => _username;

  bool login(String username, String password) {
    return _username == username && _password == password;
  }

  void gantiPassword(String lama, String baru) {
    if (_password == lama) {
      if (baru.length >= 8) {
        _password = baru;
        print('✅ Password berhasil diubah.');
      } else {
        print('❌ Gagal: Password baru minimal 8 karakter.');
      }
    } else {
      print('❌ Gagal: Password lama tidak sesuai.');
    }
  }
}

// ============================================================
// FUNGSI DEMO UNTUK SETIAP CLASS
// ============================================================

void demoMobil() {
  print('\n🔹 DEMO 1: CLASS MOBIL - CONSTRUCTOR');
  print('=' * 50);
  
  var m1 = Mobil('Honda', 2020);
  var m2 = Mobil.baru();
  var m3 = Mobil.dariJson({'merk': 'Suzuki', 'tahun': 2021});
  
  print('Default: $m1');
  print('Named .baru: $m2');
  print('dariJson: $m3');
}

void demoWarna() {
  print('\n🔹 DEMO 2: CLASS WARNA - CONST CONSTRUCTOR');
  print('=' * 50);
  
  const merah = Warna(255, 0, 0);
  const merahLagi = Warna(255, 0, 0);
  
  print('Warna 1: $merah');
  print('Warna 2: $merahLagi');
  print('Instance sama? ${identical(merah, merahLagi)}'); // true
}

void demoTitik() {
  print('\n🔹 DEMO 3: CLASS TITIK - INITIALIZER LIST');
  print('=' * 50);
  
  var t1 = Titik(3.0, 4.0);
  var t2 = Titik(-5.0, 10.0);
  var t3 = Titik(-1.5, -2.5);
  
  print('Titik 1: (${t1.x}, ${t1.y})');
  print('Titik 2: (${t2.x}, ${t2.y})');
  print('Titik 3: (${t3.x}, ${t3.y})');
}

void demoPersonPrivate() {
  print('\n🔹 DEMO 4: CLASS PERSON - PRIVATE FIELD');
  print('=' * 50);
  
  var p = PersonPrivate("Salma", 20);
  print('Nama: ${p.name} (via getter)');
  print('Usia: ${p.age}');
  print('Catatan: Field _name tidak bisa diakses langsung');
}

void demoPersonGetter() {
  print('\n🔹 DEMO 5: CLASS PERSON - GETTER');
  print('=' * 50);
  
  var p = PersonGetter("Salma", 20);
  print('Via method getName(): ${p.getName()}');
  print('Via getter getName1: ${p.getName1}');
}

void demoPersonSetter() {
  print('\n🔹 DEMO 6: CLASS PERSON - SETTER');
  print('=' * 50);
  
  var p = PersonSetter("Salma", 20);
  print('Nama awal: ${p.getName}');
  
  p.setName('Aqila');
  print('Via setName: ${p.getName}');
  
  p.setName1 = 'Nabila';
  print('Via setter: ${p.getName}');
}

void demoProduk() {
  print('\n🔹 DEMO 7: CLASS PRODUK - VALIDASI');
  print('=' * 50);
  
  var produk = Produk('Monitor Samsung', 3500.0);
  print('Awal: ${produk.nama} - Rp${produk.harga}');
  
  // Update valid
  produk.nama = 'Keyboard Mekanik';
  produk.harga = 1200.0;
  print('Valid: ${produk.nama} - Rp${produk.harga}');
  
  // Update invalid
  print('\nMencoba update invalid:');
  produk.nama = 'TV';        // < 3 karakter
  produk.harga = -100.0;      // <= 0
  print('Hasil: ${produk.nama} - Rp${produk.harga} (tetap)');
}

void demoUser() {
  print('\n🔹 DEMO 8: CLASS USER - LOGIN & PASSWORD');
  print('=' * 50);
  
  var user = User('admin_user', 'securePass123');
  print('Username: ${user.username}');
  
  // Login
  print('\nLogin sukses: ${user.login('admin_user', 'securePass123')}');
  print('Login gagal: ${user.login('admin_user', 'wrongPass')}');
  
  // Ganti password sukses
  print('\nGanti password:');
  user.gantiPassword('securePass123', 'newPass456');
  print('Login dgn password baru: ${user.login('admin_user', 'newPass456')}');
  
  // Ganti password gagal
  print('\nGanti password gagal:');
  user.gantiPassword('salah', 'gagal');
  user.gantiPassword('newPass456', 'short');
}

// ============================================================
// MAIN FUNCTION - MENJALANKAN SEMUA DEMO
// ============================================================
void main() {
  print('\n' + '=' * 60);
  print('📚 PROGRAM DEMONSTRASI OOP DART (8 KONSEP)');
  print('=' * 60);
  
  demoMobil();
  demoWarna();
  demoTitik();
  demoPersonPrivate();
  demoPersonGetter();
  demoPersonSetter();
  demoProduk();
  demoUser();
  
  print('\n' + '=' * 60);
  print('✅ SEMUA DEMO SELESAI');
  print('=' * 60);
}
