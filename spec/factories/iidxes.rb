FactoryBot.define do
  factory :iidx do
    name { "IIDX筐体" }
    serial_no { "AAAAAA000000" }
    spring_weight { 1 }
    switch_weight { 0.01 }
    cash_price { 10 }
    paseli_availability { false }
    paseli_standard_price { 10 }
    paseli_premium_price { 10 }
    premium_free_price_from { 10 }
    premium_free_price_to { 10 }
    premium_free_time_from { 1 }
    premium_free_time_to { 1 }
    association :amusement_arcade, factory: :amusement_arcade
    association :iidx_version, factory: :iidx_version
    association :iidx_machine, factory: :iidx_machine
    association :iidx_monitor, factory: :iidx_monitor
  end
end
