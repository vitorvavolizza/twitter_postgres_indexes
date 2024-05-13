select count(distinct data->>'id')
from tweets_jsonb
where to_tsvector('english',coalesce(data->'extended_tweet'->>'full_text',data->>'text')) @@ to_tsquery('english','coronavirus') AND data->>'lang' = 'en';
