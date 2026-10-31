# Overkill Design Engine Stack (`modules/`)

`beznops` mengintegrasikan ekosistem desain multi-engine paling komprehensif dan "overkill" untuk pengembangan antarmuka web, landing page, dan aplikasi SaaS modern.

---

## 1. Daftar 24 Modul Desain

Semua modul berada di `.agents/skills/beznops/modules/` dan diorkestrasi secara otomatis oleh `beznops`:

### A. Thematic & Macrostructure Systems
- **`hallmark`** (nutlope/hallmark v2.0):
  - 56 tema arketipe siap pakai (Neo-Brutalist, Editorial Monochrome, Cyberpunk Terminal, Swiss Minimal, Luxury Serif, dsb.)
  - 21 pola makrostruktur halaman (editorial storytelling, interactive showcase, product comparison, dsb.)
  - Sistem token CSS terstandarisasi, pairing font terkurasi, dan filter anti-slop tema.

### B. Product Interface & Component Engines
- **`interface-design`** (Dammyjay93/interface-design):
  - Standar UI produk beraliran *craft-first*.
  - Perintah `design-deslop` untuk membersihkan UI dari pola-pola generik.
  - Perintah `design-review` untuk audit kontras, hierarki spasi, micro-interactions, dan responsive states.
- **`shadcn` & `shadcn-migrate-radix-to-base`** (shadcn/ui official):
  - Komponen Tailwind/Radix UI yang modular dan accessible.
  - Integrasi CLI `components.json` otomatis.
  - Skrip migrasi Radix ke Base UI.

### C. Anthropic Senior Frontend & Canvas Stack
- **`anthropic-frontend-design`**: Arsitektur komponen web production-grade dan layout responsif.
- **`anthropic-theme-factory`**: Dynamic theme generator & token management.
- **`anthropic-canvas-design`**: Visual komposisi generatif dan interaktif canvas.
- **`anthropic-algorithmic-art`**: Seni prosedural matematis, shader, dan SVG interaktif.
- **`anthropic-web-artifacts-builder`**: Standalone self-contained single-file HTML preview builder.
- **`anthropic-webapp-testing`**: Visual regression & interaction test suite.

### D. Jakub Krehel / interfaces.dev Micro-Design Modules
- **`better-typography`**: Mikro-tipografi presisi, measure (&le; 75 karakter per baris), ritme baseline vertikal, judul maksimal 2 baris.
- **`better-colors`**: Perceived lightness, harmoni saturasi, kontras tema gelap (dark mode).
- **`better-layout`**: Distribusi ruang negatif (*negative space tension*), keseimbangan asimetris.
- **`better-ui`**: Affordance elemen interaktif, tactile feedback, state transitions.
- **`better-accessibility`**: Accessibility tree, keyboard trap, aria roles, WCAG AA compliance.
- **`better-writing`**: UX copywriting tanpa kata klise, micro-copy, status error yang ramah.
- **`better-interface`**: Sintesis desain antarmuka holistik.
- **Toolkit Diagnostik & Eksplorasi UX**:
  - `interface-review`: Review desain berbasis 7 pilar visual.
  - `explain-interface`: Dekonstruksi alasan pemilihan layout dan komponen.
  - `build-design`: Blueprint eksekusi desain bertahap.
  - `variant`: Pembuatan variasi eksplorasi visual untuk komponen/halaman.
  - `state-machine`: Pemetaan state UI lengkap (idle, loading, active, empty, error).
  - `break`: Stress-test UI dengan konten ekstrim (teks panjang, layar sempit).
  - `teardown`: Audit dekonstruksi UI kompetitor atau desain yang ada.

---

## 2. Aturan Hierarki & Presedensi (Conflict Resolution)

Agar puluhan modul ini tidak saling bertabrakan, `beznops` menggunakan aturan presedensi ketat:

```
[User Explicit Request] -> Mengaktifkan modul yang diminta secara spesifik
           â”‚
           â”œâ”€â”€> Landing Page / Marketing -> taste-skill v2 ATAU hallmark (56 archetypes)
           â”‚                                 + better-typography + anti-slop
           â”‚
           â”œâ”€â”€> SaaS / Web App / Dashboard -> interface-design + taste-skill --app
           â”‚                                 + shadcn/ui + better-ui + state-machine
           â”‚
           â””â”€â”€> Canvas / Generative Art -> anthropic-canvas-design / algorithmic-art

====================== UNIVERSAL HARD FLOOR (NON-NEGOTIABLE) ======================
  1. Anti-Slop R-01..R-38 (Dilarang pakai gradien ungu, kartu mengambang palsu, em-dash).
  2. Kontras WCAG AA (Minimal 4.5:1 untuk teks normal, 3:1 untuk elemen grafis).
```

---

## 3. Cara Penggunaan dalam Percakapan

Cukup panggil perintah sesuai kebutuhan:

- `"Buatkan landing page dengan tema Hallmark Cyberpunk Terminal"` -> Menggunakan `modules/hallmark` dengan preset cyberpunk.
- `"Audit UI halaman ini dengan interface-design dan better-typography"` -> Menjalankan `design-review` + kalkulasi tipografi.
- `"Buatkan dashboard analitik SaaS lengkap"` -> Mengombinasikan `references/app-screens.md`, `interface-design`, `better-ui`, dan `shadcn`.
- `"Tambahkan efek visual kanvas generatif di hero section"` -> Menggunakan `anthropic-canvas-design`.
