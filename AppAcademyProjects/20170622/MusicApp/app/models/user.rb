class User < ApplicationRecord
  validates( :email,
    :password_digest,
    :session_token,
    :activation_token,
    presence: true)
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :activation_token, :email, :session_token, uniqueness: true

  attr_reader :password
  after_initialize :ensure_session_token
  after_initialize :set_activation_token

  has_many :notes

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    user && user.is_password?(password) ? user : nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = generate_unique_token_for_field(:session_token)
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= generate_unique_token_for_field(:session_token)
  end

  def set_activation_token
    self.activation_token = generate_unique_token_for_field(:activation_token)
  end

  def activate!
    self.update_attribute(:activated, true)
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
