class Alumni < ActiveRecord::Base
  belongs_to :user
  belongs_to :location
  has_many :projects
  has_many :endorsements
  accepts_nested_attributes_for :user, :endorsements
  mount_uploader :avatar, AvatarUploader
  mount_uploader :resume, ResumeUploader
  accepts_nested_attributes_for :user
end
