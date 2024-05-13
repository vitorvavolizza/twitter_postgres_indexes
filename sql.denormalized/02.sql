select tag, count(*) AS count
from (
    select distinct data->>'id' AS id_tweets, '#' || (jsonb_array_elements(data->'entities'->'hashtags' || coalesce(data->'extended_tweet'->'entities'->'hashtags','[]'))->>'text') AS tag
    from tweets_jsonb
    where data ->'entities'->'hashtags' @@ '$[*].text == "coronavirus"' OR data->'extended_tweet'->'entities'->'hashtags' @@ '$[*].text == "coronavirus"'
) t1
group by tag
order by count DESC, tag
LIMIT 1000;
