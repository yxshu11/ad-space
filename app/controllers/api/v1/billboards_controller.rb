class Api::V1::BillboardsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @billboards = Billboard.joins(:category).active.where(categories: { slug_url: params[:category] })
    render json: @billboards.map { |billboard| billboard.as_json.merge({ image_url: url_for(billboard.image), impressions: billboard.impressions.count }) }
  end

  def update
    @billboard = Billboard.active.where(id: params[:id])

    if @billboard.present?
      billboard = @billboard.first
      billboard.impressions.create!
      render json: billboard.as_json.merge({ image_url: url_for(billboard.image), impressions: billboard.impressions.count })
    else
      render json: { error: "Billboard not found" }, status: 404
    end
  end
end
