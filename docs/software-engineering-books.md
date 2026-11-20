# Software Architecture & Engineering Classics (`modules/books/`)

`beznops` mengintegrasikan sintesis aturan praktis dari **14 buku rekayasa perangkat lunak paling berpengaruh di dunia** (diadaptasi dari *agent-rules-books* karya ciembor). Modul ini memberikan fondasi arsitektur, clean code, refactoring, dan sistem berskala besar saat merancang maupun menulis kode.

---

## 1. Daftar 14 Buku Arsitektur & Desain

Semua panduan tersimpan di direktori `.agents/skills/beznops/modules/books/` dengan struktur modular (`SKILL.md`, `*.mini.md`, dan `*.md` lengkap):

| Modul Buku | Penulis / Sumber | Fokus Utama & Aturan Kunci |
| :--- | :--- | :--- |
| **`clean-code`** | Robert C. Martin (Uncle Bob) | Standar penamaan jelas, fungsi kecil berskala tunggal (Single Responsibility), eliminasi argumen berlebih (maksimal 2-3), penanganan error tanpa return code null/palsu, dan penjelasan fungsi/logika yang bersih. |
| **`clean-architecture`** | Robert C. Martin | Dependency Rule (ketergantungan selalu mengarah ke dalam), pemisahan entitas domain, use cases, controller, dan adapter interface dari framework atau database eksternal. |
| **`the-pragmatic-programmer`** | Andrew Hunt & David Thomas | Prinsip DRY (Don't Repeat Yourself), orthogonality, Broken Windows Theory, ETC (Easier To Change), crash early, dan defensive programming yang pragmatis. |
| **`refactoring`** & **`refactoring-guru`** | Martin Fowler & Alexander Shvets | Katalog katalog refactoring (Extract Method, Inline Class, Replace Conditional with Polymorphism), identifikasi *code smells* (Long Method, Feature Envy, Primitive Obsession), dan desain pola (GoF design patterns). |
| **`a-philosophy-of-software-design`** | John Ousterhout | Konsep modul yang dalam (*Deep Modules: simple interface, powerful implementation*), pengelolaan kompleksitas sistem, penanganan error seminimal mungkin dengan mendefinisikannya keluar dari eksistensi (*define errors out of existence*). |
| **`code-complete`** | Steve McConnell | Disiplin konstruksi perangkat lunak, teknik defensif, checklist arsitektur kelas, dan desain pseudocode sebelum implementasi. |
| **`domain-driven-design`**, **`domain-driven-design-distilled`**, & **`implementing-domain-driven-design`** | Eric Evans & Vaughn Vernon | Pemodelan domain kompleks, Ubiquitous Language, Bounded Contexts, Aggregates, Value Objects, Entities, Repositories, Domain Events, dan Strategic Design. |
| **`designing-data-intensive-applications`** (DDIA) | Martin Kleppmann | Keandalan (Reliability), skalabilitas, maintainability, konsistensi data (ACID vs BASE), pemodelan storage & indexing, partisi, replikasi, dan sistem terdistribusi. |
| **`patterns-of-enterprise-application-architecture`** (PoEAA) | Martin Fowler | Pola arsitektur enterprise: Unit of Work, Identity Map, Data Mapper, Domain Model, Service Layer, Optimistic Offline Lock. |
| **`release-it`** | Michael T. Nygard | Stabilitas sistem produksi: Circuit Breaker, Bulkhead, Timeouts, Shed Load, Steady State, Fail Fast, dan arsitektur anti-cascade failure. |
| **`working-effectively-with-legacy-code`** | Michael Feathers | Teknik menangani *legacy code*: menemukan titik injeksi (*seams*), karakterisasi pengujian (*characterization tests*), dan refactoring aman tanpa merusak perilaku sistem yang sudah berjalan. |

---

## 2. Standar Penjelasan Fungsi & Logika (Function & Logic Header Standard)

Sesuai standar `beznops`, setiap fungsi, method, dan blok logika bisnis yang tidak sepele **wajib dilengkapi komentar penjelasan di atasnya**:

### Contoh Penerapan yang Baik:
```typescript
/**
 * Menghitung diskon berjenjang dan kupon promosi pada keranjang belanja.
 * - Memverifikasi batas kuota kupon dan masa berlaku secara real-time.
 * - Menerapkan aturan diskon volume jika total belanja mencapai ambang batas sebelum ongkos kirim.
 * @throws {CouponExpiredException} Jika kode kupon sudah kedaluwarsa.
 */
export async function calculateTieredCartDiscount(cart: Cart, couponCode?: string): Promise<DiscountResult> {
  // Verifikasi apakah pelanggan memenuhi syarat diskon loyalitas sebelum evaluasi kupon eksternal
  const loyaltyTier = await getCustomerLoyaltyTier(cart.customerId);
  ...
}
```

### Yang Diharamkan (Slop):
- ❌ Komentar dekoratif tanpa arti: `// ================== HELPER ==================`
- ❌ Komentar yang hanya mengulang nama fungsi: `// function to get cart discount`
- ❌ Komentar checklist flow: `// Step 1: get cart, Step 2: calculate discount`

---

## 3. Alur Orkestrasi Rekayasa Perangkat Lunak

Saat pengguna meminta arsitektur atau pengembangan fitur, `beznops` secara cerdas mengombinasikan:
1. **Ponytail**: Menentukan solusi paling ringkas dan tuntas (YAGNI).
2. **Clean Architecture / DDD**: Menentukan batas domain dan isolasi lapisan aplikasi.
3. **Refactoring & Clean Code**: Menulis kode yang ekspresif dengan penjelasan fungsi yang jelas.
4. **Release It / DDIA**: Memastikan keandalan, timeout, dan ketahanan terhadap beban tinggi.
