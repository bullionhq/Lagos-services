# Lagos Services

A clean service listing platform connecting people in Lagos with skilled providers.

## About

Lagos Services is building a calm, competent marketplace where residents of Lagos can find, vet, and hire trusted service providers across the city. This repository contains the MVP foundation aligned with the locked UI Design Spec (0.13).

Currently in **Phase 0 — Foundation**. The scaffold is in place and the team can move directly into Phase 1 (Supabase) and Phase 2 (App Foundation + design tokens).

## Tech Stack

- **Framework** — Next.js (App Router)
- **Language** — TypeScript
- **Styling** — Tailwind CSS
- **Backend / DB** — Supabase (Phase 1)
- **Edge / CDN** — Cloudflare

## Getting Started

### Prerequisites

- Node.js 18+ (LTS recommended)
- npm

### Run locally

```bash
# 1. Install dependencies
npm install

# 2. Set up environment variables
cp .env.example .env.local
# then edit .env.local with real values from your Supabase project

# 3. Start the development server
npm run dev
```

Open [http://localhost:3000](http://localhost:3000) in your browser.

### Other scripts

```bash
npm run build    # Production build
npm run start    # Run production build
npm run lint     # Run ESLint
```

## Environment Variables

All secrets live in `.env.local` — **never commit this file**. It is already excluded via `.gitignore`.

Copy `.env.example` to `.env.local` and fill in:

| Variable                        | Description                                |
| ------------------------------- | ------------------------------------------ |
| `NEXT_PUBLIC_SUPABASE_URL`      | Supabase project URL (safe for client)     |
| `NEXT_PUBLIC_SUPABASE_ANON_KEY` | Supabase anon key (safe for client)        |
| `SUPABASE_SERVICE_ROLE_KEY`     | Supabase service role key (server-side only — never expose to client) |

Supabase keys are provisioned in Phase 1. Leave them as placeholders until then.

## Project Structure

```
lagos-services/
├── src/
│   └── app/              # App Router entrypoint (pages, layouts, routes)
├── public/               # Static assets
├── .env.example          # Env variable template (commit this)
├── .env.local            # Real secrets (never commit)
├── next.config.ts
├── tailwind config       # (in globals.css via Tailwind v4 @theme)
├── tsconfig.json
└── package.json
```

A deliberate, locked component list will be added in Phase 2. No extra UI libraries are installed in the foundation.

## Notes

- This is the MVP foundation. Pages, components, and business logic will be added in subsequent phases.
- The default placeholder page is minimal by design and will be replaced.
- Secrets handling follows the principle: template committed, values ignored.
