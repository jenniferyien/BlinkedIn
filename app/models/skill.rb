class Skill < ActiveRecord::Base
  has_many :endorsements
  has_many :desired_skills
  has_many :alumnis, through: :endorsements
  has_many :employers, through: :desired_skills
end
