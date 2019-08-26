FactoryBot.define do
  factory :iidx do
    serial_no { "AAAAAA000000" }
    spring_weight { 1 }
    switch_weight { 0.01 }
    cash_price { 10 }
    paseli_availability { false }
    paseli_price { 10 }
    premium_free_time_from { 1 }
    premium_free_time_to { 1 }
    association :amusement_arcade, factory: :amusement_arcade
  end
end
