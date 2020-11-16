class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :info
    validates :category, numericality: { other_than: 1 }
    validates :sales_status, numericality: { other_than: 1 }
    validates :shipping_fee_status, numericality: { other_than: 1 }
    validates :prefecture, numericality: { other_than: 1 }
    validates :scheduled_delivery, numericality: { other_than: 1 }
    validates :price
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery
end
