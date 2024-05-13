select
tag,
count(*) AS count
from (
    select distinct
    data->>'id' AS id_tweets,
    '#' || (jsonb_array_elements(data->'entities'->'hashtags' ||
            COALESCE(data->'extended_tweet'->'entities'->'hashtags','[]'))->>'text') AS tag
    from tweets_jsonb
    where to_tsvector('english', COALESCE(data->'extended_tweet'->>'full_text', data->>'text')) @@
    to_tsquery('english','coronavirus')
    AND data->>'lang' = 'en'
) t
group by (1)
order by count DESC, tag
LIMIT 1000;
