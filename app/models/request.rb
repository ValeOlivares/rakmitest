class Request < ApplicationRecord
  belongs_to :user
  has_many :comments
  acts_as_votable
  accepts_nested_attributes_for :comments
  
end
