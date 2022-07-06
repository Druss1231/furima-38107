class OrderDestination
  include ActiveModel::Model
  attr_accessor :post_code, :from_id, :city, :address_line, :building, :phone, :user_id, :item_id, :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)", allow_blank: true}
    validates :from_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :address_line
    validates :phone, format: {with: /\A\d{10}$|^\d{11}\z/, allow_blank: true}
    validates :item_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    destination = Destination.new(post_code: post_code, prefecture: from_id, city: city, address_line: address_line, building: building, order_id: order.id)
    destination.save!
  end
end