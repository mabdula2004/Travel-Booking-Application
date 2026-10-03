# Roamly — Travel Booking Experience

A premium editorial travel-discovery and booking product built with React, Vite and Supabase.

## Visual direction

Roamly deliberately avoids the generic OTA/dashboard look. The direction is **editorial travel magazine × conversion-focused booking product**: immersive photography, expressive serif display type, a quiet forest/cream palette, compact discovery controls and generous whitespace.

Reference research was completed before implementation across current Dribbble and Behance travel-booking work plus premium web patterns. The implementation is original rather than a clone. Patterns studied included image-first discovery, low-friction search, curated choice architecture, transparent pricing, trust cues and mobile-first booking flows.

## Feature set

- Immersive responsive hero with destination, date and traveller search
- Curated journey catalog with category filters and live text search
- Saved-journey mode with optimistic interaction feedback
- Journey detail modal with pricing and experience highlights
- Booking drawer with date, traveller controls, notes and transparent totals
- Sign-in/sign-up/account drawer wired for Supabase Auth
- Live catalog loading/error/empty states with local portfolio fallback
- Supabase-backed saved journeys when authenticated
- Secure server-side booking RPC with database-calculated pricing
- Editorial brand/story section and travel journal
- Mobile navigation and purpose-built desktop/tablet/mobile layouts
- Keyboard-visible focus states, semantic dialogs and accessible control labels
- Automated Playwright overflow and interaction QA at desktop, tablet and mobile widths
- Automated 30+ second working-project showcase export after the quality gate passes

## Stack

React 18 · Vite · Supabase · PostgreSQL · Playwright · Lucide React · CSS design system

## Local setup

```bash
npm install
cp .env.example .env
npm run dev
```

Add the project's Supabase URL and **publishable key** to `.env`. Never place a service-role key in the browser.

```env
VITE_SUPABASE_URL=...
VITE_SUPABASE_PUBLISHABLE_KEY=...
```

Production and QA checks:

```bash
npm run build
npm run test:e2e
npm run preview
```

## Backend architecture

`supabase/migrations/001_initial_schema.sql` defines profiles, journeys, saved journeys and bookings with RLS. Public visitors can only read active journeys. User-owned rows are restricted to the authenticated owner.

`supabase/migrations/002_seed_and_secure_booking.sql` seeds the curated catalog and adds `create_booking(...)`. The RPC reads the current journey price in PostgreSQL, validates the future departure date and traveller count, calculates the subtotal/service fee server-side, and inserts the booking for `auth.uid()`.

## Quality gate

GitHub Actions builds the production bundle, launches the real Vite app, checks desktop/tablet/mobile interactions and horizontal overflow, captures evidence, records the actual walkthrough, verifies it is at least 30 seconds, and exports the MP4 showcase. The project is ready for publishing only after that gate passes and the dedicated Supabase backend is connected and verified.
