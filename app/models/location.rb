class Location < ActiveRecord::Base
  has_many :employers
  has_many :alumnis
end
