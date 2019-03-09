class ShortLinks::AnalyticsController < ApplicationController
  # GET /:short_code+
  def show
    @short_link = ShortLink.find_by short_code: params[:short_code]

    if @short_link.present?
      render status: :ok
    else
      render json: { errors: 'URL not found' }, status: :not_found
    end
  end
end
