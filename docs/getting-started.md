# Panduan Mulai Cepat (Getting Started)

Selamat datang di **`beznops`**! Panduan ini menjelaskan cara tercepat untuk mulai menggunakan sistem ini di proyek harian Anda dengan Antigravity.

---

## 1. Konsep Dasar `beznops`

`beznops` menggabungkan dua sisi yang sering bertolak belakang saat AI membuat kode:
1. **Desain / Frontend**: AI sering membuat desain yang terlihat generik, "slop", menggunakan gradien ungu, kartu-kartu identik, dan animasi berlebihan. `beznops` menggantinya dengan **Art Direction berbasis riset galeri kurasi (Awwwards/One Page Love)** dan filter ketat 38 aturan anti-slop.
2. **Rekayasa Perangkat Lunak / Backend**: AI sering menulis kode berlebihan (*over-engineered*), membuat wrapper yang tidak perlu, atau lupa memeriksa dampak perubahan pada *caller*. `beznops` membatasi agen dengan disiplin **Lazy Senior Developer (YAGNI)**, pelacakan caller menyeluruh, dan 6-Phase Verification Loop.

---

## 2. Cara Kerja Otomatis di Antigravity

Antigravity menggunakan sistem **Progressive Disclosure**:
- Anda **tidak perlu** meng-copy-paste aturan panjang ke dalam prompt chat.
- Agen Antigravity akan membaca instruksi dari [`.agents/skills/beznops/SKILL.md`](../.agents/skills/beznops/SKILL.md) secara bertahap saat Anda memberikan tugas.
- Agen hanya akan membuka berkas referensi spesifik di `references/` yang dibutuhkan untuk tugas tersebut, menjaga *context window* tetap bersih dan efisien.

---

## 3. Alur Kerja Praktis Berdasarkan Peran

### Alur Kerja A: Membangun Landing Page Baru
1. Berikan deskripsi singkat tentang produk/klien Anda.
2. Minta agen menjalankan `The 10-Step Page Run` dari `beznops`.
3. Agen akan:
   - Mengambil 8–12 fakta spesifik subjek (bukan kategori generik).
   - Mengundi 3 arah desain unik (`scripts/draw.mjs`).
   - Menyusun argumen berurutan (bukan template hero + 3 kartu).
   - Menghubungkan tipografi dan palet warna ke CSS tokens.
   - Menjalankan inspeksi browser headless (`scripts/inspect.mjs`) pada 3 breakpoint (`1440px`, `768px`, `390px`) untuk memastikan **0 FAIL**.

### Alur Kerja B: Memperbaiki Bug atau Menambah Fitur
1. Tunjukkan fungsi atau file yang bermasalah.
2. Gunakan instruksi: *"Pakai beznops level full, perbaiki masalah ini dengan perubahan terkecil yang tuntas."*
3. Agen akan:
   - Melacak semua pemanggil (*caller*) fungsi sebelum menyentuh kode.
   - Memperbaiki akar masalah sekali di kode bersama.
   - Menguji *edge case* (null, kosong, boundary).
   - Menutup respons dengan 2 baris footer wajib: `Skipped / Not checked` dan `Risk`.

### Alur Kerja C: Audit Kualitas Sebelum Release
1. Sebelum merge ke branch utama atau deployment, ketik:
   *"Jalankan beznops mode audit pada repo ini."*
2. Agen menghasilkan laporan tanpa mengubah kode terlebih dahulu:
   - **Must Fix**: Bug nyata, lubang keamanan OWASP, data loss.
   - **Should Fix**: Duplikasi kode, modul tanpa test, fungsi multitugas.
   - **Lean**: Pengurangan baris kode dan pembersihan dependensi sampah.
3. Anda cukup memilih nomor temuan yang ingin diperbaiki (misal: *"Tolong perbaiki nomor 1 dan 3"*).
