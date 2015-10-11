class Employer < ActiveRecord::Base
  belongs_to :location
  belongs_to :user
  has_many :desired_skills
  has_many :skills, through: :desired_skills
  accepts_nested_attributes_for :skills
  mount_uploader :avatar, AvatarUploader
end
