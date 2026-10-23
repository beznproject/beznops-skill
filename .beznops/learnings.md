# Project Learnings & Context Memory

Dokumen ini mencatat konvensi arsitektur, preferensi stack, dan keputusan teknis khusus untuk proyek ini agar agen Antigravity tidak mengulangi kesalahan atau mempertanyakan ulang keputusan yang sudah disepakati.

## Stack & Tooling Preferences
- **Package Manager**: pnpm / npm / bun (sesuaikan dengan lockfile aktif)
- **Formatting & Linting**: Biome / Prettier / ESLint
- **Styling**: Tailwind CSS / Vanilla CSS Variables

## Technical Guardrails
- Immutability by default pada seluruh transformasi state.
- Hindari pembuatan wrapper atau helper class satu kali pakai (YAGNI).
- Setiap shortcut performa atau batasan skala wajib diberi komentar `// shortcut: <limit>, <upgrade trigger>`.

## Design & UI Decisions
- Teks judul (`h1` - `h6`) maksimal 2 baris pada semua breakpoint.
- Tanpa em-dash (`—`) dan tanpa marketing buzzwords generik.
- Kontras warna teks wajib lolos WCAG AA (>= 4.5:1 untuk normal text).
