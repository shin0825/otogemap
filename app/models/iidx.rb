class Iidx < ApplicationRecord
    validates :serial_no, length: { is: 12 }, format: { with: /\A[a-zA-Z]{6}\d{6}\z/, message: "シリアルは半角アルファベット6文字と半角数値6文字となります" }, allow_nil: true
    validates :spring_weight, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 100}, allow_nil: true
    validates :switch_weight, numericality: { greater_than_or_equal_to: 0.01, less_than_or_equal_to: 1.00}, allow_nil: true
    validates :cash_price, numericality: { only_integer: true, greater_than_or_equal_to: 10, less_than_or_equal_to: 1000}, presence: true
    validates :paseli_availability, inclusion: { in: [true, false] }
    validates :paseli_price, numericality: { only_integer: true, greater_than_or_equal_to: 10, less_than_or_equal_to: 1000 }, allow_nil: true
    validates :premium_free_time_from, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 99 }, allow_nil: true
    validates :premium_free_time_to, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 99 }, allow_nil: true
end
