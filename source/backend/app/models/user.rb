class User < ApplicationRecord
  include TwoFactorAuthentication
  has_secure_password
  before_create :generate_otp_secret
  # serialize :propic, :binary

  has_many :sent_reports, class_name: "Report", foreign_key: "from_id", dependent: :destroy
  has_many :recieved_reports, class_name: "Report", foreign_key: "from_id", dependent: :destroy
  has_many :actions, dependent: :destroy

  validates :username, presence: { message: "Username not given." }, uniqueness: { case_sensitive: false, message: "Username already taken." }, format: { with: /\A[a-z0-9_]+\z/, message: "Invalid username." }
  validates :email, presence: { message: "Email not given." }, uniqueness: { case_sensitive: false, message: "Email already taken." }, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Invaid email." }

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
  end

  def reports
    Report.where("from_id = ? OR to_id = ?", self.id, self.id)
  end

  def index
    {
      username: self.username,
      type: self.type,
      email: self.email,
    }
  end

  def report_user(to:, description:)
    report = Report.new(reciever: to, sender: self, description: description, time: Time.now)
  end

  def change_password(new_password:)
    self.password = new_password
  end

  def change_email(new_email:)
    self.email = new_email
  end
end
