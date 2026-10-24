# `beznops` — The Unified Senior Engineering & Art Direction System for Antigravity

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Antigravity%20%7C%20AGY-orange.svg)](https://antigravity.google)
[![Cross-Platform](https://img.shields.io/badge/OS-Windows%20%7C%20macOS%20%7C%20Linux-green.svg)](install.sh)

**`beznops`** adalah plugin dan skill terpadu (*unified system*) untuk **Google Antigravity**, menggabungkan 4 repositori kelas dunia menjadi satu alur kerja kohesif:

1. **[`anti-slop`](https://github.com/miqdadbadjuber/anti-slop.git)** — 38 aturan wajib (`R-01`–`R-38`), Craftsmanship Standard (`C-1`–`C-5`), Liveliness Dials (`ENERGY / RHYTHM / MOTION`), filter anti-AI-slop (UI, copywriting, WCAG AA, mobile reflow, kebersihan komentar).
2. **[`taste-skill` v2](https://github.com/Leonxlnx/taste-skill.git)** — Sistem Art Direction dari riset 247 situs Awwwards & One Page Love, pengundi arah (`draw.mjs`), pencari foto arsip komersial (`assets.mjs`), linter (`lint.mjs`), inspektor browser asli (`inspect.mjs`), dan scroll scenes (`scenes.mjs`).
3. **[`ponytail`](https://github.com/DietrichGebert/ponytail.git)** — Disiplin Senior Developer pragmatis: *smallest complete change*, 6 tangga YAGNI, pelacakan caller, pelacak utang teknis `// shortcut: <limit>, <trigger>`, serta mode `audit`, `review`, dan `debt`.
4. **[`everything-claude-code`](https://github.com/WorldFlowAI/everything-claude-code.git)** — Standar arsitektur produksi (React/Next.js frontend, API/Repository/DB backend), checklist keamanan OWASP 10-poin, alur TDD pragmatis, orkestrasi subagent, dan **6-Phase Verification Loop**.

---

## ⚡ Fitur Utama

- 🎨 **Art Direction Berbasis Riset**: Bukan sekadar template acak. Mengundi 20 arah desain unik, palet warna proporsional, dan sistem tipografi yang terbukti unggul pada studi 247 situs galeri kurasi.
- 🛡️ **Filter Slop & Craftsmanship Ketat**: Menghilangkan gradien ungu generik, testimoni palsu (*fake stats/avatars*), *bento grid* pasaran, *em-dash* (`—`), dan teks pemasaran klise.
- 📐 **Inspeksi Browser Asli**: Menjalankan headless Chrome/Edge pada resolusi `1440px`, `768px`, dan `390px` untuk mengukur kontras, ritme spasi, dan kelengkapan elemen.
- ⚡ **Minimalis & Hemat Kode (YAGNI)**: Tidak ada *wrapper*, factory, atau abstraksi satu kali pakai yang tidak diminta. Selalu mencari solusi terkecil yang tuntas.
- 🔒 **Keamanan & TDD Produksi**: Validasi Zod di batas API, sanitasi XSS, pencegahan SQL Injection, serta pengujian perilaku berbasis Arrange-Act-Assert (AAA).
- 🤖 **Subagents Mandiri**: Dilengkapi 3 agen spesialis: `beznops-architect`, `beznops-reviewer`, dan `beznops-crafter`.
- 🪝 **Lifecycle Hooks**: Perlindungan otomatis terhadap em-dash, buzzwords, dan secrets sebelum berkas disimpan.

---

## 📦 Panduan Instalasi

### Opsi 1: Pasang Global ke Antigravity (Rekomendasi)

Agar `beznops` otomatis aktif di semua sesi dan proyek Antigravity Anda:

**Di Windows (PowerShell):**
```powershell
powershell -ExecutionPolicy Bypass -File "install.ps1"
```

**Di macOS / Linux / WSL (Bash):**
```bash
chmod +x install.sh
./install.sh
```

Berkas akan otomatis disalin ke direktori global Antigravity: `~/.gemini/config/skills/beznops`.

---

### Opsi 2: Pasang ke Proyek Tertentu Saja

Jika Anda hanya ingin memasang skill ini pada satu repositori kerja:

**Windows:**
```powershell
powershell -ExecutionPolicy Bypass -File "install.ps1" -TargetProject "D:\path\ke\proyek-anda"
```

**macOS / Linux:**
```bash
./install.sh /path/ke/proyek-anda
```

---

### Opsi 3: Gunakan Langsung Sebagai Workspace

Buka folder repositori ini langsung melalui Antigravity IDE (**File > Open Folder...**). Antigravity akan otomatis mendeteksi `.agents/skills/beznops/SKILL.md`.

---

## 🚀 Cara Penggunaan Sehari-Hari

Cukup panggil `beznops` atau jelaskan tugas Anda di chat Antigravity:

| Kebutuhan Tugas | Contoh Prompt di Antigravity |
| :--- | :--- |
| **Landing Page / Web Baru** | *"Pakai `beznops`, buatkan landing page untuk brand kopi lokal 'Kawah Ijen' yang hanya sangrai 1 batch seminggu. Jalankan alur 10-step Page Run, undi arah desainnya, dan pastikan lolos Delivery Gate."* |
| **Dashboard / App Screen** | *"Pakai `beznops` mode `--app`, rancang tampilan dashboard pemantauan server untuk retry job yang gagal."* |
| **Fitur / Bug Fix Tanpa Over-Engineering** | *"Pakai `beznops` (level full), perbaiki bug validasi token ini. Cek semua caller-nya dulu sebelum mengubah kode."* |
| **Audit Kualitas Seluruh Repo** | *"Jalankan `beznops` mode **audit** untuk mengecek bug, celah keamanan, dan dead code di repo ini."* |
| **Review Git Diff / PR** | *"Jalankan `beznops` mode **review** untuk memeriksa uncommitted diff terakhir."* |
| **Audit Slop UI yang Sudah Ada** | *"Pakai `beznops` mode **after** untuk mengaudit UI halaman ini dan laporkan temuan bernomor R-XX sebelum diedit."* |
| **TDD & Verifikasi 6 Fase** | *"Pakai `beznops` mode **tdd** untuk membuat modul auth baru, lalu jalankan **6-Phase Verification Loop**."* |
| **Pindai Utang Teknis Shortcut** | *"Jalankan `beznops` mode **debt** untuk memindai semua komentar `shortcut:` di repo ini."* |

---

## 📂 Struktur Repositori

```text
beznops/
├── plugin.json                                 # Manifest resmi Antigravity plugin
├── install.ps1                                 # Installer Windows PowerShell
├── install.sh                                  # Installer macOS / Linux / WSL
├── README.md                                   # Dokumentasi utama
├── docs/                                       # Buku panduan lengkap & mendalam
│   ├── getting-started.md                      # Panduan pemula & alur kerja
│   ├── architecture-and-subagents.md           # Penjelasan subagent & hooks
│   ├── art-direction-and-antislop.md           # Panduan desain 10-step & aturan R-01..R-38
│   └── senior-engineering-and-tdd.md           # Panduan coding, YAGNI, audit, & verifikasi
├── hooks/
│   └── hooks.json                              # Konfigurasi lifecycle hooks Antigravity
├── templates/                                  # Blueprints siap pakai bebas slop
│   ├── landing-page/index.html                 # Template landing page fluid clamp()
│   └── api-endpoint/route.ts                   # Template endpoint Zod + typed response
├── .beznops/
│   └── learnings.md                            # Continuous project memory
└── .agents/
    ├── agents/                                 # Subagents mandiri Antigravity
    │   ├── beznops-architect.md                # Evaluator arsitektur & YAGNI
    │   ├── beznops-reviewer.md                 # Auditor PR, caller trace, & OWASP
    │   └── beznops-crafter.md                  # Art Director & verifikator UI
    └── skills/
        └── beznops/
            ├── SKILL.md                        # Instruksi Master & Task Router
            ├── assets/                         # CSS/JS foundation (base.css, app.css, dll.)
            ├── library/                        # 9 database JSON kurasi desain web
            ├── references/                     # 26 modul referensi lengkap
            └── scripts/                        # Executable tools & helper fallback
                ├── draw.mjs                    # Art direction dealer
                ├── inspect.mjs                 # Headless browser inspector (1440, 768, 390)
                ├── lint.mjs                    # Source code anti-slop linter
                ├── assets.mjs                  # Commercial-safe archival media searcher
                ├── scenes.mjs                  # Scroll scene multi-frame verifier
                ├── contrast-check.py           # WCAG AA contrast calculator
                └── beznops-helper.ps1          # Zero-dependency PowerShell fallback
```

---

## 🛠️ Executable Tools Bawaan

Semua script pembantu dapat dijalankan langsung di terminal proyek:

```bash
# Mengundi 3 arah art direction (Node.js):
node .agents/skills/beznops/scripts/draw.mjs --sector saas --options 3

# Menjalankan inspeksi browser asli (Chrome/Edge):
node .agents/skills/beznops/scripts/inspect.mjs http://localhost:3000

# Menghitung rasio kontras teks (Python):
python .agents/skills/beznops/scripts/contrast-check.py "#FFFFFF" "#777777"

# Fallback murni Windows PowerShell (tanpa Node / Python):
powershell -ExecutionPolicy Bypass -File .agents/skills/beznops/scripts/beznops-helper.ps1 contrast "#FFFFFF" "#777777"
powershell -ExecutionPolicy Bypass -File .agents/skills/beznops/scripts/beznops-helper.ps1 draw -Sector saas
powershell -ExecutionPolicy Bypass -File .agents/skills/beznops/scripts/beznops-helper.ps1 lint .
```

---

## 📚 Dokumentasi Lanjutan

Untuk membaca panduan lebih mendalam, buka dokumen di folder [`docs/`](docs/):
- 📖 [Panduan Mulai Cepat (`docs/getting-started.md`)](docs/getting-started.md)
- 🏛️ [Subagents & Lifecycle Hooks (`docs/architecture-and-subagents.md`)](docs/architecture-and-subagents.md)
- 🎨 [Art Direction & 38 Aturan Anti-Slop (`docs/art-direction-and-antislop.md`)](docs/art-direction-and-antislop.md)
- 🛡️ [Senior Engineering, YAGNI & TDD (`docs/senior-engineering-and-tdd.md`)](docs/senior-engineering-and-tdd.md)

---

## 📄 Lisensi

Didistribusikan di bawah lisensi **MIT**. Silakan gunakan, modifikasi, dan integrasikan ke proyek Anda dengan bebas.
