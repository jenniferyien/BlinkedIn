class User < ActiveRecord::Base
  has_many :endorsements
end
