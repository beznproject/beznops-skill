import { z } from 'zod';

// 1. Strict input validation schema
export const CreateItemSchema = z.object({
  title: z.string().min(1, 'Judul wajib diisi').max(120),
  description: z.string().max(1000).optional(),
  priority: z.enum(['low', 'medium', 'high']).default('medium')
});

export type CreateItemDto = z.infer<typeof CreateItemSchema>;

// 2. Standard API response structure
export interface ApiResponse<T = unknown> {
  success: boolean;
  data?: T;
  error?: string;
  meta?: {
    total?: number;
    page?: number;
    limit?: number;
  };
}

// 3. Reusable API Handler (Next.js / Standard Web Request example)
export async function handleCreateItem(request: Request): Promise<Response> {
  try {
    const json = await request.json().catch(() => null);
    if (!json) {
      return Response.json(
        { success: false, error: 'Request body tidak valid (JSON diharapkan).' } satisfies ApiResponse,
        { status: 400 }
      );
    }

    // Input validation
    const parsed = CreateItemSchema.safeParse(json);
    if (!parsed.success) {
      const issue = parsed.error.issues[0]?.message || 'Validasi gagal.';
      return Response.json(
        { success: false, error: issue } satisfies ApiResponse,
        { status: 400 }
      );
    }

    // Business Logic / Persistence
    // const created = await db.item.create({ data: parsed.data });
    const mockCreated = { id: 'item_123', ...parsed.data, createdAt: new Date().toISOString() };

    return Response.json(
      { success: true, data: mockCreated } satisfies ApiResponse,
      { status: 201 }
    );
  } catch (err: unknown) {
    // Log internal error safely without exposing internal details to user
    console.error('[API Error]:', err instanceof Error ? err.message : err);

    return Response.json(
      { success: false, error: 'Terjadi kesalahan internal pada server.' } satisfies ApiResponse,
      { status: 500 }
    );
  }
}
