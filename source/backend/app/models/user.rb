class User < ApplicationRecord
  include TwoFactorAuthentication
  has_secure_password
  before_create :generate_otp_secret

  def generate_otp_secret
    self.totp_secret = ROTP::Base32.random_base32
  end

  def authenticate_otp(otp)
    totp = ROTP::TOTP.new(self.totp_secret)
    totp.verify(otp, drift_behind: 30, drift_ahead: 30)
  end

  def provisioning_uri
    totp = ROTP::TOTP.new(self.totp_secret)
    totp.provisioning_uri(username)
  end

  def self.find_by_jwt(jwt)
    User.find(JsonWebToken.decode(jwt)["user_id"])
    # User.find(decoded[:user_id])
  end

  def codemonkey
    Codemonkey.find_by(username: username)
  end

  def admin
    Admin.find_by(username: username)
  end

  def company
    Company.find_by(username: username)
  end

  has_one :codemonkey, -> { where(kind: "codemonkey") }, foreign_key: "username", primary_key: "username", dependent: :destroy
  has_one :admin, -> { where(kind: "admin") }, foreign_key: "username", primary_key: "username", dependent: :destroy
  has_one :company, -> { where(kind: "company") }, foreign_key: "username", primary_key: "username", dependent: :destroy
end
