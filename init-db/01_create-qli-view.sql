-- CREATE QLI VIEW

CREATE EXTENSION file_fdw;

CREATE SERVER pglog FOREIGN DATA WRAPPER file_fdw;


CREATE FOREIGN TABLE public.postgres_log (
    log_time timestamp(3) with time zone,
    user_name text,
    database_name text,
    process_id integer,
    connection_from text,
    session_id text,
    session_line_num bigint,
    command_tag text,
    session_start_time timestamp with time zone,
    virtual_transaction_id text,
    transaction_id bigint,
    error_severity text,
    sql_state_code text,
    message text,
    detail text,
    hint text,
    internal_query text,
    internal_query_pos integer,
    context text,
    query text,
    query_pos integer,
    location text,
    application_name text,
    backend_type text,
    empty_column text,
    column_with_zeroes text
    )
SERVER pglog
OPTIONS (filename 'pg_log/postgresql.csv', format 'csv');


CREATE VIEW public.alation_postgres_logv AS
SELECT
  session_id,
  user_name,
  session_line_num,
  session_start_time,
  process_id,
  connection_from,
  transaction_id,
  command_tag,
  message,
  log_time,
  sql_state_code,
  error_severity,
  location,
  query,
  database_name,
  application_name
FROM postgres_log
;

