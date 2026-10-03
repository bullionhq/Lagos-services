-- Lagos Services MVP — row level security + policies

-- ─────────────────────────────────────────────
-- enable RLS
-- ─────────────────────────────────────────────
alter table public.categories enable row level security;
alter table public.profiles   enable row level security;
alter table public.services   enable row level security;

-- ─────────────────────────────────────────────
-- categories: public read
-- ─────────────────────────────────────────────
drop policy if exists "categories are readable by everyone" on public.categories;
create policy "categories are readable by everyone"
  on public.categories
  for select
  using (true);

-- ─────────────────────────────────────────────
-- profiles: public read (MVP simplicity — safe because profiles are provider identity)
-- ─────────────────────────────────────────────
drop policy if exists "profiles are readable by everyone" on public.profiles;
create policy "profiles are readable by everyone"
  on public.profiles
  for select
  using (true);

-- anyone (anon) can submit a new profile
drop policy if exists "anyone can insert a profile" on public.profiles;
create policy "anyone can insert a profile"
  on public.profiles
  for insert
  with check (true);

-- ─────────────────────────────────────────────
-- services: public read on approved only
-- ─────────────────────────────────────────────
drop policy if exists "approved services are readable by everyone" on public.services;
create policy "approved services are readable by everyone"
  on public.services
  for select
  using (status = 'approved');

-- anyone (anon) can submit a new service; it must begin as pending
drop policy if exists "anyone can insert a pending service" on public.services;
create policy "anyone can insert a pending service"
  on public.services
  for insert
  with check (status = 'pending');
