# `beznops` — The Unified Senior Engineering, Design & Architecture System for Antigravity

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Antigravity%20%7C%20AGY-orange.svg)](https://antigravity.google)
[![Cross-Platform](https://img.shields.io/badge/OS-Windows%20%7C%20macOS%20%7C%20Linux-green.svg)](install.sh)

**`beznops`** adalah plugin dan skill terpadu (*unified system*) paling komprehensif untuk **Google Antigravity**, menggabungkan **7 pilar arsitektur kelas dunia**, **14 buku rekayasa klasik**, **Google Chrome Modern Web Guidance**, dan **24 modul desain frontend** menjadi satu ekosistem kohesif berstandar industri tinggi.

---

## 🏛️ Tujuh Pilar Inti (`beznops`)

1. **[`anti-slop`](https://github.com/miqdadbadjuber/anti-slop.git)** — 38 aturan wajib (`R-01`–`R-38`), Craftsmanship Standard (`C-1`–`C-5`), Liveliness Dials, filter anti-AI-slop (UI, copywriting bebas em-dash `—`, WCAG AA contrast, mobile reflow, komentar bersih).
2. **[`taste-skill` v2](https://github.com/Leonxlnx/taste-skill.git)** — Sistem Art Direction dari riset 247 situs Awwwards & One Page Love, pengundi arah desain (`draw.mjs`), pencari foto arsip komersial (`assets.mjs`), linter (`lint.mjs`), dan inspektor browser nyata (`inspect.mjs` di 1440/768/390px).
3. **[`ponytail`](https://github.com/DietrichGebert/ponytail.git)** — Disiplin Senior Developer pragmatis: *smallest complete change* (YAGNI), pelacakan caller, pelacak utang teknis `// shortcut: <limit>, <trigger>`, serta mode `audit`, `review`, dan `debt`.
4. **[`everything-claude-code`](https://github.com/WorldFlowAI/everything-claude-code.git)** — Standar arsitektur produksi (React/Next.js frontend, API/Repository backend), checklist keamanan OWASP 10-poin, alur TDD pragmatis, orkestrasi subagent, dan **6-Phase Verification Loop**.
5. **Overkill Design Engine Stack (`modules/*`)** — 24 modul desain frontend terpadu yang menggabungkan:
   - **[Hallmark v2.0](https://github.com/nutlope/hallmark)**: 56 tema arketipe (Cyberpunk, Neo-Brutalist, Swiss Minimal, dll.) & 21 makrostruktur halaman.
   - **[Interface Design](https://github.com/Dammyjay93/interface-design)**: Standar craft-first UI, `design-deslop`, dan `design-review`.
   - **[shadcn/ui](https://github.com/shadcn/ui)**: Komponen modular Tailwind/Radix UI & migrasi otomatis.
   - **[Anthropic Skills](https://github.com/anthropics/skills)**: Frontend architecture, Canvas visual design, Algorithmic art, Theme factory, dan Web artifact builder.
   - **[interfaces.dev / Jakub Krehel](https://github.com/jakubkrehel/skills)**: 14 modul mikro-desain (Better Typography, Colors, Layout, UI, Accessibility, Writing, State Machine, Teardown).
6. **Software Engineering Classics & Clean Code Architecture (`modules/books/*`)** — 14 buku rekayasa perangkat lunak legendaris (berdasarkan [agent-rules-books](https://github.com/ciembor/agent-rules-books)): Clean Code, Clean Architecture, The Pragmatic Programmer, Refactoring, A Philosophy of Software Design, Designing Data-Intensive Applications (DDIA), Domain-Driven Design (DDD), Code Complete, Release It!, PoEAA, dan Working Effectively with Legacy Code.
   - **Standar Penjelasan Logika & Fungsi**: Wajib mencantumkan komentar/docstring yang jelas di atas setiap fungsi atau blok logika non-trivial agar mudah dipahami manusia tanpa menjadi AI-slop.
7. **[Google Chrome Modern Web Guidance](https://github.com/GoogleChrome/modern-web-guidance)** — Standar resmi tim Google Chrome untuk API platform web modern: HTML5 `<dialog>` & native popovers, CSS Anchor Positioning, View Transitions API, Container Queries, Core Web Vitals (LCP, INP, CLS), Web Security, dan PWA.

---

## 🎯 Panduan Pemanggilan Terfokus (Focused Sub-Skills)

Selain memanggil `beznops` secara menyeluruh, Anda dapat memanggil keahlian khusus secara spesifik dan terfokus:

| Perintah / Panggilan | Nama Sub-Skill | Fungsi & Cakupan Fokus |
| :--- | :--- | :--- |
| **`/beznops-typography`** | `beznops-typography` | **Fokus Tipografi & Copywriting**: Mengatur ritme vertikal, *measure* (60-75ch per baris), judul &le;2 baris, OpenType `tabular-nums`, melarang em-dash (`—`), dan membersihkan kata-kata klise (*anti-buzzwords*). |
| **`/beznops-web`** | `beznops-web` | **Fokus Modern Web & Chrome Guidance**: Mengimplementasikan native `<dialog>`, popovers, anchor positioning, view transitions, dan optimasi Core Web Vitals (LCP/INP/CLS) tanpa library bloated. |
| **`/beznops-design`** | `beznops-design` | **Fokus Art Direction & UI Craft**: Memilih 56 tema Hallmark, de-slop antarmuka (`design-deslop`), audit komponen shadcn/ui, dan merancang dashboard SaaS. |
| **`/beznops-clean`** | `beznops-clean` | **Fokus Clean Code & Arsitektur 14 Buku**: Refactoring modular, pemisahan lapisan domain/DDD, serta menulis penjelasan fungsi & logika yang jelas dan mudah dipahami. |
| **`/beznops-audit`** | `beznops-audit` | **Fokus Audit Repo, Keamanan & Utang Kode**: Memeriksa celah keamanan OWASP 10-poin, memindai ledger `// shortcut:`, dan melacak referensi pemanggil (*caller tracing*). |

---

## ⚡ Panduan Cepat Penggunaan (Guideline & Examples)

### 1. Merancang Landing Page atau Halaman Web
```
"Buatkan landing page fintech dengan tema Hallmark Swiss Minimal, gunakan beznops-web untuk dialog popover dan pastikan beznops-typography diterapkan."
```
*Hasil:* Halaman memiliki tema asimetris elegan, kontras tinggi, native popover dialog, dan teks yang nyaman dibaca (panjang baris &le;75ch, tanpa em-dash).

### 2. Membangun Dashboard atau Fitur Aplikasi
```
"Desain dashboard analitik dengan shadcn/ui, buatkan komponen tabel data yang responsif, dan tuliskan komentar penjelasan di setiap fungsinya."
```
*Hasil:* Dashboard dengan komponen modular, tabular-nums pada angka, state loading/empty, serta docstring lengkap di atas setiap fungsinya.

### 3. Mengaudit & Refactoring Codebase
```
"/beznops-audit: tolong audit codebase ini, cari celah keamanan OWASP, dan periksa apakah ada utang kode teknis."
```
*Hasil:* Laporan terstruktur mulai dari audit keamanan, dependensi tidak terpakai, dan ringkasan ledger `// shortcut:`.

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

Berkas akan otomatis disalin ke direktori global Antigravity: `~/.gemini/config/skills/beznops` dan sub-skill terfokus lainnya.

---

### Opsi 2: Pasang ke Proyek Tertentu Saja
Jalankan skrip instalasi dengan parameter lokasi folder proyek:
```powershell
powershell -ExecutionPolicy Bypass -File "install.ps1" -TargetProject "C:\path\ke\proyek\anda"
```

---

## 📚 Dokumentasi Rujukan Lengkap
- [Arsitektur & Subagents](docs/architecture-and-subagents.md)
- [Art Direction & Anti-Slop Guide](docs/art-direction-and-antislop.md)
- [Senior Engineering & TDD Workflow](docs/senior-engineering-and-tdd.md)
- [Overkill Design Engine Stack (24 Modul)](docs/overkill-design-stack.md)
- [Software Engineering Classics & Clean Logic (14 Buku)](docs/software-engineering-books.md)
- [Google Chrome Modern Web Guidance](docs/modern-web-guidance.md)
- [Panduan Memulai Cepat (Getting Started)](docs/getting-started.md)
