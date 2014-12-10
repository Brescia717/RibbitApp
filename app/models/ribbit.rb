class Ribbit < ActiveRecord::Base
  default_scope { order('created_at DESC') }

  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true

  belongs_to :user
end
