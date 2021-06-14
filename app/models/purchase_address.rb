class PurchaseAddress
  include ActiveModel::model
  attr_accessor :postal_code, :prefecture_id, :city, :block, :build, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :city
    validates :block
    validates :build
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
    validates :user_id
    validates :item_id
  end
  validates :prefecture_id, numericality: {other_than: 1}

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block: block, build: build, phone_number: phone_number)
  end
end