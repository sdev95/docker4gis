create or replace function auth.fn_change_password
    ( in_email text
    )
returns void
language plpgsql
as $$
declare
begin
    update auth.tbl_users
    set pass = null
    , reauth = true
    where email = in_email
    ;
    if not found
    then
        raise exception 'User not found';
    end if
    ;
end;
$$;
