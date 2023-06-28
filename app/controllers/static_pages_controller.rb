class StaticPagesController < ApplicationController
  def dashboard
    @billboards = Billboard.all
    # @products = Product.all
    @billboard_impressions = Impression.where(impressionable_type: "Billboard")
    @product_impressions = Impression.where(impressionable_type: "Product")

    billboard_impressions_rate = 0.10
    product_impressions_rate = 0.05

    @available_credits = 5000
    @usage_credits = (@billboard_impressions.for_this_month.count * billboard_impressions_rate) - (@product_impressions.for_this_month.count * product_impressions_rate)
    
    @billboard_impression_average_count = @billboard_impressions.for_last_7_days.count / 7.0

    @estimated_credit_usage = (@billboard_impression_average_count * 30) * billboard_impressions_rate
  end

  def refresh_billboard
    @billboard_impressions = Impression.where(impressionable_type: "Billboard")
    @product_impressions = Impression.where(impressionable_type: "Product")

    billboard_impressions_rate = 0.10
    product_impressions_rate = 0.05

    @available_credits = 5000
    @usage_credits = (@billboard_impressions.for_this_month.count * billboard_impressions_rate) - (@product_impressions.for_this_month.count * product_impressions_rate)
    
    @billboard_impression_average_count = @billboard_impressions.for_last_7_days.count / 7.0

    @estimated_credit_usage = (@billboard_impression_average_count * 30) * billboard_impressions_rate

    render json: {
      billboard_impression_data: @billboard_impressions.group_by_day_of_week(:created_at, format: "%a").count,
      billboard_impression_count: @billboard_impressions.for_this_month.count,
      current_usage: @usage_credits,
      estimated_credit_usage: @estimated_credit_usage
    }
  end
end
