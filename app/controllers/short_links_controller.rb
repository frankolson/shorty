class ShortLinksController < ApplicationController
  # GET /:short_code
  def show
    @short_link = ShortLink.find_by short_code: params[:short_code]

    if @short_link.present?
      redirect_to @short_link.long_url, status: :moved_permanently
    else
      render json: { errors: 'URL not found' }, status: :not_found
    end
  end

  # POST /short_links
  def create
    @short_link = ShortLink.find_or_initialize_by \
      long_url: short_link_params['long_url']

    if @short_link.save
      render status: :created
    else
      render json: { errors: @short_link.errors }, status: :unprocessable_entity
    end
  end

  private
    def short_link_params
      JSON.parse(request.body.read)
    end
end
