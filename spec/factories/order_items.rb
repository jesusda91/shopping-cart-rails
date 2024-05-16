FactoryBot.define do
  factory :order_item do
    product { create(:product) }
    order { create(:order) }
    quantity { 1 }
  end
end
