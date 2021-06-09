class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category_id,       null: false
  belongs_to_active_hash :status_id,         null: false
  belongs_to_active_hash :charge_id,         null: false
  belongs_to_active_hash :prefecture_id,     null: false
  belongs_to_active_hash :duration_id,       null: false

  belongs_to :user
  has_one_attached :image
end
