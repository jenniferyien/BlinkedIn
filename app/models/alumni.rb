class Alumni < ActiveRecord::Base
  belongs_to :user
  belongs_to :location
  has_many :projects
  has_many :endorsements
  has_many :skills, through: :endorsements
  accepts_nested_attributes_for :endorsements, :projects, :skills
  mount_uploader :avatar, AvatarUploader
end
