-- Lagos Services MVP — schema
-- categories, profiles, services + indexes + categories seed

-- ─────────────────────────────────────────────
-- categories
-- ─────────────────────────────────────────────
create table if not exists public.categories (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  slug text not null unique,
  created_at timestamptz not null default now()
);

create index if not exists categories_slug_idx on public.categories (slug);

-- ─────────────────────────────────────────────
-- profiles
-- ─────────────────────────────────────────────
create table if not exists public.profiles (
  id uuid primary key default gen_random_uuid(),
  user_id uuid,
  name text not null,
  bio text,
  phone text,
  whatsapp text,
  location text,
  avatar_url text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists profiles_user_id_idx on public.profiles (user_id);

-- ─────────────────────────────────────────────
-- services
-- ─────────────────────────────────────────────
create table if not exists public.services (
  id uuid primary key default gen_random_uuid(),
  profile_id uuid not null references public.profiles (id) on delete cascade,
  category_id uuid not null references public.categories (id) on delete restrict,
  title text not null,
  description text not null,
  price numeric,
  price_unit text,
  images text[],
  status text not null default 'pending',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint services_status_check check (status in ('pending', 'approved', 'rejected'))
);

create index if not exists services_status_idx on public.services (status);
create index if not exists services_category_id_idx on public.services (category_id);
create index if not exists services_profile_id_idx on public.services (profile_id);
create index if not exists services_approved_category_idx
  on public.services (category_id) where status = 'approved';
create index if not exists services_approved_profile_idx
  on public.services (profile_id) where status = 'approved';

-- updated_at triggers

create or replace function public.set_updated_at()
returns trigger as $$
begin
  new.updated_at = now();
  return new;
end;
$$ language plpgsql;

drop trigger if exists profiles_updated_at_trigger on public.profiles;
create trigger profiles_updated_at_trigger
before update on public.profiles
for each row execute function public.set_updated_at();

drop trigger if exists services_updated_at_trigger on public.services;
create trigger services_updated_at_trigger
before update on public.services
for each row execute function public.set_updated_at();

-- ─────────────────────────────────────────────
-- seed categories
-- ─────────────────────────────────────────────
insert into public.categories (name, slug) values
  ('Plumbing', 'plumbing'),
  ('Electrical', 'electrical'),
  ('Cleaning', 'cleaning'),
  ('Repairs', 'repairs'),
  ('Beauty', 'beauty'),
  ('Photography', 'photography'),
  ('Catering', 'catering'),
  ('Construction', 'construction'),
  ('Generator Services', 'generator-services'),
  ('Painting', 'painting')
on conflict (slug) do nothing;
