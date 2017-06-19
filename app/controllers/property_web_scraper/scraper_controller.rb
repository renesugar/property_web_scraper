require_dependency "property_web_scraper/application_controller"

module PropertyWebScraper
  class ScraperController < ApplicationController
    def retrieve

      unless params[:source_url].present?
        return render json: { error: "Please provide url."}, status: 422
      end

      target_url = params[:source_url]

      retrieved_properties = PropertyWebScraper::Scraper.new(target_url).retrieve_from_webpage

      render json: retrieved_properties


      # render json: {
      #   success: true
      # }
    end
  end
end
