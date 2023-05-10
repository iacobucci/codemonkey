class User < ApplicationRecord
  include TwoFactorAuthentication
  has_secure_password

  before_create :generate_otp_secret
  def generate_otp_secret
    self.totp_secret = ROTP::Base32.random_base32
  end

  def otp_secret_encryption_key
    Rails.application.credentials.otp_secret_key
  end
  
  def otp_secret
    self.totp_secret ||= ROTP::Base32.random_base32
  end

  def authenticate_otp(otp)
    totp = ROTP::TOTP.new(self.otp_secret)
    totp.verify(otp, drift_behind: 30, drift_ahead: 30)
  end
  
  def provisioning_uri
    totp = ROTP::TOTP.new(self.totp_secret)
    totp.provisioning_uri(username)
  end

end
