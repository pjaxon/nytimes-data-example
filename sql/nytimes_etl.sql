TRUNCATE stage.nyt_us_states;
UPDATE stage.nyt_us_counties SET cases = 0 WHERE cases = '';
UPDATE stage.nyt_us_counties SET deaths = 0 WHERE deaths = '';
UPDATE stage.nyt_us_counties SET fips = NULL WHERE fips = '';
ALTER TABLE "stage"."nyt_us_counties" 
ALTER COLUMN "date" TYPE date USING "date"::date, 
ALTER COLUMN "fips" TYPE int4 USING "fips"::int4,
ALTER COLUMN "cases" TYPE int4 USING "cases"::int4,
ALTER COLUMN "deaths" TYPE int4 USING "deaths"::int4;
