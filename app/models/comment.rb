class Comment < ApplicationRecord
  before_create :accepted_default

  belongs_to :article
  belongs_to :user

  scope :accepted, -> {where(accepted: true)} 
  scope :non_accepted, -> {where(accepted: false)} 

  scope :old, -> {where("created_at < ?", 2.days.ago)}

  def accepted_default
    self.accepted = false
  end

  def self.accept_old
    Comment.old.non_accepted.update_all(accepted: true)
  end
end
