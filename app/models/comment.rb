class Comment < ApplicationRecord
  before_create :accepted_default

  belongs_to :article
  belongs_to :user

  scope :accepted, -> {where(accepted: true)} 
  scope :non_accepted, -> {where(accepted: false)} 

  def accepted_default
    self.accepted = false
  end
end
