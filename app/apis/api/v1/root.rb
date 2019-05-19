module API
  module V1
    class Root < Grape::API
      protect_from_forgery with: :null_session
      version 'v1', using: :path
      format :json
      post '/pvs' do
        pv_params = params.fetch(:pv, {})
        @pv = Pv.new
        @pv.url = pv_params[:url]
        @site = Site.find_by(url: URI.parse(@pv[:url]).host)
        @pv[:site_id] = @site.id
        @pv.save
      end
    end
  end
end
