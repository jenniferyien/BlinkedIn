class User < ActiveRecord::Base
  has_many :endorsements
  has_one :employer
  has_one :alumni
end
