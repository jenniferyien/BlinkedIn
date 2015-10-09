class Alumni < ActiveRecord::Base
  belongs_to :user
  belongs_to :location
  has_many :projects
  has_many :endorsements

  accepts_nested_attributes_for :endorsements, :projects, allow_destroy: true, :reject_if => proc { |h| h['name'].blank? }

  has_many :skills, through: :endorsements

  mount_uploader :avatar, AvatarUploader
  mount_uploader :resume, ResumeUploader
end
