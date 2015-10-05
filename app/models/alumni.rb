class Alumni < ActiveRecord::Base
  belongs_to :user
  belongs_to :location
  has_many :projects
  has_many :endorsements
end
