class Bill < ActiveRecord::Base
  belongs_to :user
  has_many :portions
end
