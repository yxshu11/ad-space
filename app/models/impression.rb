class Impression < ApplicationRecord
  belongs_to :impressionable, polymorphic: true

  scope :for_this_month, lambda {where("impressions.created_at > ? AND impressions.created_at < ?", Time.now.beginning_of_month, Time.now.end_of_month)}
  scope :for_last_7_days, lambda {where("impressions.created_at > ? AND impressions.created_at < ?", (Date.today - 7.days).beginning_of_day, Time.now.end_of_day)}
end
