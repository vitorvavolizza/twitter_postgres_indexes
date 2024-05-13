select count(DISTINCT data->>'id')
from tweets_jsonb
where data->'entities'->'hashtags' @@ '$[*].text == "coronavirus"' OR data ->'extended_tweet'->'entities'->'hashtags' @@ '$[*].text == "coronavirus"';
