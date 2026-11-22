# Google Chrome Modern Web Guidance (`modules/modern-web-guidance/`)

`beznops` mengintegrasikan standar dan panduan resmi dari **Google Chrome Modern Web Guidance** (`GoogleChrome/modern-web-guidance`). Panduan ini memastikan bahwa setiap proyek web yang dibangun atau diperbarui menggunakan API bawaan platform web modern (*native web primitives*) yang lebih cepat, hemat bundle, dan memiliki performa Core Web Vitals (CWV) optimal.

---

## 1. Prinsip Utama: Native Web Primitives

Sebelum memasang library pihak ketiga (NPM) untuk interaksi UI:
1. **Modal & Dialog**: Wajib menggunakan elemen HTML5 `<dialog>` dengan `showModal()` dan atribut bawaan `popover="auto"` untuk *light dismiss*, bukan div buatan manual dengan z-index kacau.
2. **Anchor Positioning**: Menggunakan fitur CSS native `position-anchor` dan `anchor()` untuk posisi tooltip dan dropdown menu.
3. **View Transitions**: Memanfaatkan native `document.startViewTransition()` untuk animasi transisi antar halaman atau perpindahan state.
4. **Container Queries**: Menggunakan `@container` agar komponen responsif berdasarkan ukuran kontainernya sendiri, bukan hanya `@media` layar global.
5. **Animasi Berbasis Scroll**: Menggunakan CSS `@scroll-timeline` atau `animation-timeline: view()` yang diakselerasi GPU tanpa event listener scroll di JavaScript.

---

## 2. Optimasi Core Web Vitals (CWV)

- **Largest Contentful Paint (LCP)**:
  - Berikan atribut `fetchpriority="high"` pada gambar hero di atas layar (*above-the-fold*).
  - Dilarang keras memasang `loading="lazy"` pada gambar hero LCP.
  - Preload web fonts kritis menggunakan `<link rel="preload" as="font" crossorigin>`.
- **Interaction to Next Paint (INP)**:
  - Bagi tugas JavaScript panjang (*long tasks*) menggunakan `scheduler.yield()` atau *microtask chunking*.
  - Hindari *layout thrashing* (kelompokkan pembacaan DOM sebelum manipulasi DOM).
- **Cumulative Layout Shift (CLS)**:
  - Selalu cantumkan dimensi eksplisit `width` dan `height` atau properti CSS `aspect-ratio` pada semua `<img>`, `<video>`, dan iframe.
  - Siapkan ruang kosong (*skeleton*) untuk banner dinamis agar halaman tidak melompat.

---

## 3. Alur Pencarian Panduan (CLI)

Gunakan perintah resmi `modern-web-guidance`:
```bash
# Mencari panduan berdasarkan pola UI (2-5 kata)
npx -y modern-web-guidance@latest search "responsive data table"
npx -y modern-web-guidance@latest search "confirmation modal dialog"

# Mengambil isi panduan secara lengkap
npx -y modern-web-guidance@latest retrieve "<guide-id>"
```
Atau baca langsung panduan lokal di direktori `.agents/skills/beznops/modules/modern-web-guidance/guides/`.
