class Employer < ActiveRecord::Base
  belongs_to :location
  belongs_to :user
  has_many :desired_skills
  has_many :skills, through: :desired_skills
  mount_uploader :avatar, AvatarUploader
end
