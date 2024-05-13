create index idx_tweet_tags_tag on tweet_tags(id_tweets, tag);
create index idx_tweet_tags_id_tweets on tweet_tags(tag, id_tweets);
create index idx_tweets_lang on tweets(id_tweets, lang);
create index idx_tweets_lang_2 on tweets(lang);
create index idx_tweets_lang_text on tweets using gin (to_tsvector('english', text)) where lang = 'en';

