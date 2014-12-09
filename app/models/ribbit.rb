class Ribbit < ActiveRecord::Base
  attr_accessor :content, :user_id

  default_scope order: 'created_at DESC'

  validates :content, length: { maximum: 140 }

  belongs_to :user

end
