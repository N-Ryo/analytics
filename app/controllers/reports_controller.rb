class ReportsController < ApplicationController
  def index
  end

  def show
    @site = current_site
    @pvs = @site.pvs
  end
end
