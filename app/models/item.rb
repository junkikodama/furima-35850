class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :duration

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :description
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :charge_id
    validates :prefecture_id
    validates :duration_id
  end

  validates :price, presence: true, format: {with: /\A[0-9]+\z/},length: {minimum: 3, maxinum: 7},
             numericality: { only_integer: true,greater_than: 299, less_than: 10000000}

end