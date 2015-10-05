class Skill < ActiveRecord::Base
  has_many :endorsements
  has_many :desired_skills
end
