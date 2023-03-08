class ItemOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id,:postcode, :prefecture_id, :municipalities, :address, :buildingname, :telephonenumber, :token


  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}
    validates :municipalities
    validates :address
    validates :buildingname
    validates :telephonenumber{ with: /\A\d{11}\z/, message: 'is invalid' }

  
  end
  






  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(order_id: order.id, postcode: postcode, prefecture_id: prefecture_id, municipalities: municipalities, address: address, buildingname: buildingname, telephonenumber: telephonenumber)
  end
end