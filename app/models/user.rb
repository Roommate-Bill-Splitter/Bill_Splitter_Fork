class User < ActiveRecord::Base
  has_secure_password

  before_validation :ensure_auth_token!
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_uniqueness_of :email
  validates_format_of :email, with: /.+@.+\..+/
  validates :auth_token, presence: true, uniqueness: true





  has_many :roommates
  has_many :bills
  has_many :portions, through: :bills


  def ensure_auth_token!
    if self.auth_token.blank?
      self.auth_token = User.generate_token
    end
  end

  def self.generate_token
    token = SecureRandom.hex
    while User.exists?(auth_token: token)
      token = SecureRandom.hex
    end
    token
  end
end
