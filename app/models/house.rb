class House < ActiveRecord::Base
  has_many :roommates
  has_many :bills
end
