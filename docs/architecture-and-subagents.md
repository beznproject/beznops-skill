# Subagents & Lifecycle Hooks di Beznops

Dokumen ini menjelaskan arsitektur subagents otonom dan hooks otomatis yang tersedia di dalam `beznops`.

---

## 1. Subagents Spesialis (`.agents/agents/`)

Di Antigravity, subagent memungkinkan pembagian tugas berat ke proses latar belakang mandiri tanpa mengotori ruang memori (*context window*) percakapan utama Anda.

### 🏛️ `beznops-architect`
- **Tujuan**: Menilai desain sistem, struktur basis data, relasi API, dan modularitas kode sebelum implementasi dimulai.
- **Karakter**: Sangat skeptis terhadap kompleksitas berlebih. Menolak microservices atau generic event-bus jika monolithic modular sudah cukup.
- **Kapan Digunakan**:
  - Saat merencanakan fitur multi-tabel atau modul baru.
  - Saat mengevaluasi integrasi sistem eksternal atau arsitektur caching.
  - Contoh instruksi: *"Tolong minta `beznops-architect` mereview skema database pembayaran ini sebelum kita buat migrasinya."*

### 🛡️ `beznops-reviewer`
- **Tujuan**: Memeriksa perubahan kode (*git diff* atau PR) seperti insinyur senior yang bertanggung jawab saat sistem bermasalah di tengah malam.
- **Fokus Pemeriksaan**:
  - **Caller Safety**: Apakah perubahan signature fungsi merusak pemanggil di file lain?
  - **OWASP Hardening**: Tidak ada API key yang bocor, query SQL menggunakan parameter, input di-parse dengan Zod schema.
  - **Lean & YAGNI**: Menghapus baris kode yang tidak perlu daripada menambah abstraksi baru.
- **Kapan Digunakan**:
  - Sebelum membuat Pull Request atau sebelum merge.
  - Contoh instruksi: *"Jalankan `beznops-reviewer` untuk memverifikasi diff uncommitted ini."*

### 🎨 `beznops-crafter`
- **Tujuan**: Bertindak sebagai Art Director dan Frontend Lead.
- **Tugas Utama**:
  - Menjalankan 10 langkah *The Run* untuk halaman web atau aplikasi.
  - Menjamin aturan tipografi (judul <= 2 baris), kontras WCAG AA (>= 4.5:1), dan ukuran sentuh tombol ponsel (>= 44px).
  - Menjalankan script inspeksi Chrome CDP (`inspect.mjs`) sampai **0 FAIL**.
- **Kapan Digunakan**:
  - Saat membangun landing page, marketing site, atau dashboard admin.
  - Contoh instruksi: *"Panggil `beznops-crafter` untuk mendesain halaman profil pengguna ini."*

---

## 2. Lifecycle Hooks (`hooks/hooks.json`)

Hooks di `beznops` bertindak sebagai sabuk pengaman otomatis (*guardrails*) saat Anda atau agen bekerja di Antigravity:

### Event: `PreToolUse` (Edit / Write Guard)
Sebelum agen menulis file teks, HTML, CSS, atau JavaScript:
- **Blokir Em-Dash**: Karakter `—` otomatis dicegah pada teks antarmuka atau salinan tulisan (digantikan dengan koma, titik dua, atau titik biasa).
- **Blokir Buzzwords AI**: Kata-kata klise seperti *"AI Powered"*, *"Seamless"*, *"Revolutionary"*, dan *"Cutting Edge"* otomatis ditolak.
- **Proteksi Secrets**: Mencegah penulisan hardcoded token seperti `sk-...` atau kata sandi langsung di dalam kode sumber.

### Event: `PreCommit` (Verifikasi Sebelum Simpan)
Sebelum git commit dilakukan:
- Menjalankan linter statis otomatis (`beznops-helper.ps1 lint .`) untuk memastikan tidak ada kontrol mati (*dead buttons/links*) atau kesalahan struktur.
