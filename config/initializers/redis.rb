redis_url = Figaro.env.REDIS_URL

REDIS = Redis.new(url: redis_url)
