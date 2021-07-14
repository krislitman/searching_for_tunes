class SpotifyService

  def self.new_releases
    response = Faraday.get("https://api.spotify.com/v1/browse/new-releases") do |req|
      req.headers['Authorization'] = "Bearer #{getToken}"
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.getToken
    conn = Faraday.new(
      url: 'https://accounts.spotify.com'
    )
    response = conn.post('/api/token') do |req|
      req.headers['Authorization'] = "Basic #{Base64.strict_encode64(Figaro.env.spotify_client_id+ ':' + Figaro.env.spotify_client_secret)}"
      req.body = {'grant_type': 'client_credentials'}
    end
    response_two = JSON.parse(response.body, symbolize_names: true)
    REDIS.set("token", response_two[:access_token])
    REDIS.get("token")
  end
end
