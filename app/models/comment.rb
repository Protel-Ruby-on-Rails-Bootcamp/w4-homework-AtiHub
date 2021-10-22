class Comment < ApplicationRecord
  before_create :accepted_default

  belongs_to :article
  belongs_to :user

  scope :accepted, -> {where(accepted: true)} 
  scope :non_accepted, -> {where(accepted: false)} 

  scope :old, -> {where('created_at')}

  def accepted_default
    self.accepted = false
  end

  def automatic_accept
    Comment.non_accepted.update_all!(accepted: true)
  end
end
