class Article < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :user
  has_many :comments

  scope :publics, -> { where(public: true) }

  private

  def check_public
    self.public = false if public.nil?
  end
end
