class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :store

  validates_uniqueness_of :store_id, scope: :uset_id
end
