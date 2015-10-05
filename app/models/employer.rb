class Employer < ActiveRecord::Base
  belongs_to :location
  belongs_to :user
  has_many :desired_skills
end
