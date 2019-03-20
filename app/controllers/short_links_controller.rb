class ShortLinksController < ApplicationController
  # GET /:short_code
  def show
    @short_link = ShortLink.find_by short_code: params[:short_code]

    if @short_link.present?
      @short_link.mark_visit
      redirect_to @short_link.long_url, status: :moved_permanently
    else
      render json: { errors: 'URL not found' }, status: :not_found
    end
  end

  # POST /short_links
  def create
    @short_link_form = ShortLink::CreationForm.new short_link_params

    if @short_link_form.submit
      render status: :created
    else
      render json: { errors: @short_link_form.errors }, status: :unprocessable_entity
    end
  end

  private
    def short_link_params
      params.permit(:long_url, :user_id)
    end
end
