# `beznops` — Unified Antigravity Skill

Gabungan penuh (full skill) dari 4 repositori untuk Google Antigravity:

1. **[`anti-slop`](https://github.com/miqdadbadjuber/anti-slop.git)**: Filter anti-AI-slop (`R-01` s/d `R-38`), standar Craftsmanship (`C-1` s/d `C-5`), Liveliness Dials (`ENERGY / RHYTHM / MOTION`), aturan UI, Copywriting (tanpa em-dash `—` dan tanpa buzzword), Aksesibilitas (`contrast-check.py` WCAG AA), Mobile Reflow, dan kebersihan komentar kode.
2. **[`taste-skill` v2](https://github.com/Leonxlnx/taste-skill.git)**: Sistem Art Direction berbasis riset 247 situs pilihan Awwwards & One Page Love (`scripts/draw.mjs`), pencarian foto arsip berlisensi komersial (`scripts/assets.mjs`), linter statis (`scripts/lint.mjs`), inspektor browser asli pada resolusi `1440px`, `768px`, dan `390px` (`scripts/inspect.mjs`), scroll scenes (`scripts/scenes.mjs`), serta rubrik kritik visual 14-lapis.
3. **[`ponytail`](https://github.com/DietrichGebert/ponytail.git)**: Disiplin Senior Developer pragmatis — perubahan terkecil yang menyelesaikan masalah secara tuntas (*smallest complete change*), YAGNI, pelacakan seluruh *caller*, konvensi utang teknis `// shortcut: <limit>, <upgrade trigger>`, serta mode `audit`, `review`, dan `debt`.
4. **[`everything-claude-code`](https://github.com/WorldFlowAI/everything-claude-code.git)**: Standar arsitektur *full-stack* produksi (React/Next.js frontend patterns, API/Repository/DB backend patterns, Immutability), checklist keamanan OWASP 10-poin, alur kerja TDD pragmatis, orkestrasi subagent, dan **6-Phase Verification Loop**.

---

## Struktur Direktori

```text
beznops/
├── install.ps1                                 # Installer ke Global Antigravity (~/.gemini/config/skills/beznops) atau Workspace
├── README.md
└── .agents/
    └── skills/
        └── beznops/
            ├── SKILL.md                        # Instruksi utama & Task Router (4 Pilar)
            ├── scripts/                        # Executable helpers (Node 22+ & Python)
            │   ├── draw.mjs                    # Art direction dealer (Page & --app)
            │   ├── inspect.mjs                 # Real-browser CDP inspector (1440, 768, 390)
            │   ├── lint.mjs                    # Source code anti-slop & house-rule linter
            │   ├── assets.mjs                  # Open-collection archival media searcher
            │   ├── scenes.mjs                  # Scroll-scene multi-frame verifier
            │   ├── contrast-check.py           # WCAG 2.x AA contrast calculator
            │   └── lib/                        # Supporting modules (app-draw, cdp, probe, rules)
            ├── library/                        # 9 JSON databases (directions, heroes, palettes, type, app, dll.)
            ├── assets/                         # Foundation CSS/JS (base.css, app.css, charts.js, scenes/)
            └── references/                     # 26 modul dokumentasi lengkap (Progressive Disclosure)
                ├── app-screens.md              # Taste-skill: Dashboard & App UI
                ├── colour.md, copy.md, critique.md, imagery.md, layout.md, motion.md, research.md, scenes.md, tells.md, type.md
                ├── antislop-core.md, antislop-ui.md, antislop-copywriting.md, antislop-human.md, antislop-layoutmobile.md, antislop-code.md
                ├── ponytail-audit.md, ponytail-review.md, ponytail-debt.md
                └── ecc-coding-standards.md, ecc-frontend-patterns.md, ecc-backend-patterns.md, ecc-security-review.md, ecc-tdd-workflow.md, ecc-verification-and-ops.md
```

---

## Cara Menggunakan & Menginstal

### 1. Menggunakan Langsung di Workspace Ini
Jika Anda menjadikan folder `C:\Users\nafiu\.gemini\antigravity\scratch\beznops` sebagai **Active Workspace** di Antigravity, Antigravity akan langsung mendeteksi `.agents/skills/beznops/SKILL.md` secara otomatis.

### 2. Menginstal Secara Global (Untuk Semua Proyek di Antigravity)
Jalankan skrip `install.ps1` melalui PowerShell agar `beznops` terpasang di `~/.gemini/config/skills/beznops`:

```powershell
powershell -ExecutionPolicy Bypass -File "C:\Users\nafiu\.gemini\antigravity\scratch\beznops\install.ps1"
```

### 3. Menginstal ke Proyek Spesifik Lainnya
```powershell
powershell -ExecutionPolicy Bypass -File "C:\Users\nafiu\.gemini\antigravity\scratch\beznops\install.ps1" -TargetProject "D:\path\ke\proyek-anda"
```

