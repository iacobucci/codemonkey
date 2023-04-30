class AddOtpSecretEncryptionKeyToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :otp_secret_encryption_key, :string
  end
end
