# Art Direction & Aturan Anti-Slop (R-01 s/d R-38)

Dokumen ini menjelaskan integrasi antara sistem riset galeri `taste-skill` v2 dan 38 aturan filter ketat dari `anti-slop`.

---

## 1. Perbedaan: Page vs. App Screen

Sebelum mendesain atau menulis baris pertama CSS/HTML, tentukan jenis layar:

| Tipe Layar | Karakteristik | Alur Kerja yang Dipakai |
| :--- | :--- | :--- |
| **Page** | Dibaca dan di-scroll (Landing page, portfolio, situs produk, event, restoran). | Menjalankan **10-Step Page Run** di bawah. Menghindari template seksi yang seragam. |
| **App Screen** | Dikerjakan secara interaktif (Dashboard, panel admin, analitik, inbox, settings). | Menjalankan `draw.mjs --app` dan panduan `references/app-screens.md`. Prioritas pada tabel data, filter, dan alur kerja cepat. |

---

## 2. The 10-Step Page Run

1. **Inventory Subjek**: Catat 8–12 fakta otentik yang hanya dimiliki klien ini (misal: "disangrai tiap Selasa pukul 5 pagi", "hanya ada 12 meja", "gedung bekas percetakan 1920").
2. **Tulis Argumen**: Setiap seksi halaman harus mewakili sebuah klaim dan buktinya. Hapus seksi yang tidak punya klaim nyata.
3. **Undi Art Direction**: Jalankan `draw.mjs --sector <sector> --options 3` untuk memilih arah desain visual terbaik.
4. **Temukan Ide Subjek**: Rumuskan: *"Pada halaman ini, [fakta subjek] menjadi [perangkat visual yang diundi]."* Berikan 1 elemen interaktif nyata (*One Live Thing*).
5. **Tulis Salinan Teks (Copy Deck)**:
   - Judul utama (`h1`–`h6`) **wajib muat dalam 2 baris atau kurang** di semua lebar layar.
   - Satu tombol aksi utama yang spesifik (bukan "Pelajari Lebih Lanjut" atau "Mulai").
6. **Bangun Diam (Motion Off)**: Pasang warna dan tipografi dari token CSS. Gunakan minimal 4 gambar nyata dari arsip dunia (`assets.mjs`). Pastikan margin seimbang di kedua sisi.
7. **Jalankan Gate Browser**: Jalankan `inspect.mjs` di browser headless Chrome/Edge sampai **0 FAIL**.
8. **Kritik Visual**: Buka screenshot di folder `.taste-skill/inspect/`, evaluasi 14 kriteria visual, dan perbaiki 3 kekurangan teratas.
9. **Bangun Lapisan Gerak (Motion Layer)**: Tambahkan transisi masuk bertahap (60–90ms) dan umpan balik tombol dengan dukungan `prefers-reduced-motion`.
10. **Laporan & Delivery Gate**: Laporkan status akhir kepada pengguna dengan bukti verifikasi.

---

## 3. Rangkuman 38 Aturan Anti-Slop (`R-01` s/d `R-38`)

Aturan dibagi menjadi 3 tingkatan ketat:

### Grup 1: Hard Gate (Wajib Mutlak, Tanpa Pengecualian)
- **R-02 (Copywriting)**: Dilarang menggunakan tanda strip panjang (*em-dash* `—`). Gunakan koma, titik dua, atau kurung.
- **R-03 (Mobile Responsiveness)**: Tampilan mobile bukan desktop yang diperkecil. Target sentuh tombol minimal 44x44px, teks tidak overflow.
- **R-17 (Data & Angka)**: Dilarang menampilkan statistik rekayasa (seperti "99.9% Uptime" atau "10K+ Users" palsu).
- **R-18 (Testimoni)**: Dilarang membuat avatar AI atau ulasan fiktif. Jika tidak ada bukti asli, jangan tampilkan seksi testimoni.
- **R-24 (Navigasi)**: Dilarang memasang link navigasi ke halaman/seksi yang belum ada.
- **R-25 (Kontras Warna)**: Wajib memenuhi standar WCAG AA: minimal rasio kontras 4.5:1 untuk teks biasa dan 3:0:1 untuk teks besar.
- **R-26 (Elemen Interaktif)**: Semua tombol dan dropdown harus berfungsi nyata atau diberi label transparan "Coming soon".
- **R-27 (UI States)**: Tampilan data wajib memiliki 3 state: *Empty state*, *Loading state*, dan *Error state*.
- **R-32 (Aksesibilitas Keyboard)**: Seluruh interaksi harus bisa dioperasikan via tombol `Tab`, `Enter`, `Space`, dan `Escape` dengan indikator fokus yang terlihat jelas.
- **R-34 (Multi-Theme)**: Jika menyediakan fitur Dark Mode, kedua tema (Light & Dark) harus berfungsi sempurna tanpa teks yang tenggelam.
- **R-35 (Verifikasi Sebelum Rilis)**: Aplikasi wajib dijalankan atau diuji klik sebelum dinyatakan selesai.

### Grup 2: Purpose-Gate (Teknik Diizinkan Hanya Jika Ada Alasan Tertulis)
- **R-01 (Warna & Gradien)**: Gradien ungu-ke-biru generik dilarang sebagai warna default. Boleh dipakai hanya jika merupakan identitas brand dengan alasan tertulis.
- **R-04 (Ikon)**: Hindari ikon generik AI (kilau/sparkle, bintang, robot). Gunakan ikon yang relevan dengan konten.
- **R-06 (Tipografi)**: Dilarang menggunakan font monospace besar sebagai dekorasi tanpa kaitan dengan kode/teknis asli.
- **R-07 (Background Grid)**: Garis kotak blueprint atau dot grid dilarang kecuali mendukung identitas brand asli.
- **R-09 (Badges)**: Dilarang menggunakan pill badge kapsul bertuliskan "AI Powered" atau "Beta" di atas judul utama.
- **R-10 (Glassmorphism)**: Efek blur/backdrop-filter dibatasi maksimal 1–2 elemen (tidak boleh di navbar, kartu, modal sekaligus).
- **R-12 & R-13 (Shadows & Glow)**: Bayangan dan efek glow hanya sebagai aksen fokus, bukan diterapkan ke seluruh elemen.

### Grup 3: Quality Locks (Kerapian & Konsistensi)
- **C-1 s/d C-5**: Standar Craftsmanship (Intentionality, Functional Completeness, Content-Driven Composition, Resilience, Evidence Over Claims).
- **Liveliness Dials**: Tentukan tingkat `ENERGY` (1–3), `RHYTHM` (1–3), dan `MOTION` (1–3) sebelum membuat antarmuka agar halaman tetap hidup dan tidak steril.
