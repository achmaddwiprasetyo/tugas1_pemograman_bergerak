# Tugas 1 Pemograman Bergerak (🔐 Password Management)  
_Aplikasi Manajer Password Lokal dengan Flutter + SQFLite_

![Flutter](https://img.shields.io/badge/Flutter-3.x-blue?logo=flutter)
![License](https://img.shields.io/badge/License-MIT-green)
![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20Linux%20%7C%20Windows-lightgrey)
![SQLite](https://img.shields.io/badge/Database-SQFLite-blueviolet)

---

## 📱 Deskripsi
**Password Management** adalah aplikasi penyimpanan password berbasis **Flutter** dengan dukungan **SQLite lokal (sqflite & sqflite_common_ffi)**.  
Aplikasi ini memungkinkan kamu menyimpan akun, username, dan password secara **aman & offline**, dengan tampilan **Material 3 modern** dan **dark mode otomatis**.

---

## ✨ Fitur Utama
✅ CRUD Lengkap (Tambah, Tampilkan, Ubah, Hapus)  
✅ SQLite Lokal (offline, cepat, aman)  
✅ Realtime Search (pencarian langsung)  
✅ Kategori akun (Email, Sosial, Bank, Game, Lainnya)  
✅ Material 3 UI + Grid Responsif  
✅ Dark Mode Otomatis  
✅ Footer dengan Copyright  
✅ Kompatibel di **Android, Linux, Windows, macOS**

---

## 🏗️ Teknologi yang Digunakan
| Komponen | Teknologi |
|-----------|------------|
| Framework | [Flutter](https://flutter.dev) |
| Database | [SQFLite](https://pub.dev/packages/sqflite), [SQFLite Common FFI](https://pub.dev/packages/sqflite_common_ffi) |
| Bahasa | Dart |
| UI | Material Design 3 |
| IDE | VSCode / Android Studio |

---

## 🚀 Cara Menjalankan Project

### 1️⃣ Clone Repository
```bash
git clone https://github.com/achmaddwiprasetyo/tugas1_pemograman_bergerak
cd tugas1_pemograman_bergerak
```

### 2️⃣ Install Dependency
```bash
flutter pub get
```

### 3️⃣ Jalankan Aplikasi
```bash
flutter run
```

### 📁 Struktur Folder

```bash
lib/
├── main.dart                     # Entry point aplikasi
├── db/
│   └── database_helper.dart      # Inisialisasi dan fungsi CRUD SQLite
├── models/
│   └── password_model.dart       # Model data password
├── screens/
│   ├── home_page.dart            # Halaman utama (tampilan data + pencarian)
│   ├── add_password_page.dart    # Halaman tambah data
│   ├── edit_password_page.dart   # Halaman edit data
│   └── password_detail_page.dart # (Opsional) Detail data password
├── themes/
│   └── app_theme.dart            # Tema Material 3 dan mode gelap otomatis
└── widgets/
    └── password_card.dart        # Widget kartu tampilan password



