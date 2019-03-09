Rails.application.routes.draw do
  resource :short_link, only: :create

  get '/:short_code+', to: 'short_links/analytics#show', as: :short_link_analytics
  get '/:short_code',  to: 'short_links#show',           as: :shortened
end
