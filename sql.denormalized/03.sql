select lang, count(*) AS count
from (
    select distinct data->>'id' AS id_tweets, data->>'lang' AS lang
    from tweets_jsonb
    where data ->'entities'->'hashtags' @@ '$[*].text == "coronavirus"' OR data->'extended_tweet'->'entities'->'hashtags' @@ '$[*].text == "coronavirus"'
) t1
group by lang
order by count DESC, lang
LIMIT 1000;
