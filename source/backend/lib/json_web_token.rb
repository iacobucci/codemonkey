require "jwt"

module JsonWebToken
  SECRET_KEY = Rails.application.secrets.secret_key_base.to_s

  def self.encode(payload)
    payload.reverse_merge!(meta)
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    JWT.decode(token, SECRET_KEY)[0]
  end

  private

  def self.meta
    { exp: 7.days.from_now.to_i }
  end
end
