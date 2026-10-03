-- The auth trigger must be callable by Postgres internally, not exposed as an API RPC.
revoke execute on function public.handle_new_user() from public, anon, authenticated;
