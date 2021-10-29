class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user

  enum status: {
    pending: 0,
    accepted: 1,
    denied: 2
  }

  scope :old, -> {where("created_at < ?", 2.days.ago)}
  scope :not_old, -> {where("created_at >= ?", 2.days.ago)}

  def self.accept_old
    self.pending.old.update_all(status: :denied)
  end
end
