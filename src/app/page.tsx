export default function Home() {
  return (
    <div className="flex flex-1 items-center justify-center bg-white px-6 py-24 dark:bg-zinc-950">
      <main className="w-full max-w-xl text-center">
        <p className="mb-4 text-sm font-medium tracking-widest text-zinc-500 uppercase dark:text-zinc-400">
          Lagos Services
        </p>
        <h1 className="mb-6 text-4xl font-semibold leading-tight tracking-tight text-zinc-900 dark:text-zinc-50 sm:text-5xl">
          Foundation in place.
        </h1>
        <p className="text-lg leading-8 text-zinc-600 dark:text-zinc-400">
          MVP scaffold is ready. Phase 1–2 will bring Supabase integration,
          design tokens, and the full service-listing experience for Lagos.
        </p>
      </main>
    </div>
  );
}
