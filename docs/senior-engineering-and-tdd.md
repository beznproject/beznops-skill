# Senior Engineering, YAGNI & Siklus Verifikasi

Dokumen ini menjelaskan pilar rekayasa kode di `beznops`, yang menggabungkan kedisiplinan *Ponytail* dan arsitektur *Everything-Claude-Code*.

---

## 1. Filosofi: The Smallest Complete Change

> *"The best code is the code never written."*

Seorang insinyur senior memecahkan masalah menyeluruh dengan baris kode baru seminimal mungkin:
1. **Apakah fitur ini benar-benar diminta?** Lewati opsi, flag, atau fleksibilitas yang tidak ada di kebutuhan dasar.
2. **Sudah ada di codebase?** Pakai helper atau komponen yang sudah ada.
3. **Ada di Standard Library / Web API?** Gunakan fitur bawaan platform daripada menambah dependensi baru.
4. **Dependensi yang sudah terpasang?** Gunakan library yang sudah ada di `package.json`. Jangan pernah menginstal paket baru hanya untuk 5 baris fungsi logika biasa.
5. **Dapatkah ditulis dalam 1 baris jelas?** Tulis 1 baris yang langsung dipahami saat dibaca.

### Pelacakan Caller (Sebelum Edit Kode)
Ketika memperbaiki bug atau mengubah fungsi:
- Jangan langsung mengedit fungsi tersebut.
- Cari (*grep*) semua file dan pemanggil (*caller*) fungsi tersebut.
- Pastikan perubahan signature atau return value tidak merusak alur di tempat lain.

---

## 2. Konvensi Shortcut Debt Ledger (`// shortcut:`)

Saat Anda terpaksa mengambil jalan pintas teknis demi kecepatan rilis:
- Wajib cantumkan komentar dengan format standar:
  ```typescript
  // shortcut: <batasan saat ini>, <pemicu untuk upgrade nanti>
  ```
- Contoh nyata:
  ```typescript
  // shortcut: in-memory cache maksimal 1000 item, pindah ke Redis saat user concurrent > 500
  ```
- Kapan saja Anda bisa memindai seluruh utang teknis ini dengan memanggil prompt:
  *"Jalankan beznops mode debt"*

---

## 3. The 6-Phase Verification Loop

Sebelum kode di-commit atau diserahkan ke pengguna, `beznops` menjalankan verifikasi 6 tahap:

```text
┌────────────────────────────────────────────────────────┐
│ 1. BUILD CHECK: npm run build / cargo build            │
└───────────────────────────┬────────────────────────────┘
                            ▼
┌────────────────────────────────────────────────────────┐
│ 2. TYPE CHECK: npx tsc --noEmit / pyright              │
└───────────────────────────┬────────────────────────────┘
                            ▼
┌────────────────────────────────────────────────────────┐
│ 3. LINT CHECK: npm run lint & beznops-helper.ps1 lint  │
└───────────────────────────┬────────────────────────────┘
                            ▼
┌────────────────────────────────────────────────────────┐
│ 4. TEST SUITE: npm test (TDD Red-Green-Refactor)       │
└───────────────────────────┬────────────────────────────┘
                            ▼
┌────────────────────────────────────────────────────────┐
│ 5. SECURITY & BROWSER SCAN: No secrets, inspect.mjs    │
└───────────────────────────┬────────────────────────────┘
                            ▼
┌────────────────────────────────────────────────────────┐
│ 6. DIFF & CALLERS REVIEW: git diff --stat              │
└────────────────────────────────────────────────────────┘
```

Jika salah satu tahap gagal, **berhenti dan selesaikan** sebelum melanjutkan ke tahap berikutnya.

---

## 4. Format Laporan Penutup Wajib

Setiap kali menyelesaikan tugas pengkodean, agen diwajibkan menutup dengan 2 baris ringkas:
- **Skipped / Not checked**: Hal-hal ekstra yang sengaja tidak dibuat atau lingkungan yang tidak bisa diuji secara lokal.
- **Risk**: Batasan skala dari kode saat ini atau peringatan penting bagi pengguna.
