class ReportsController < ApplicationController
  VALID_SORT_COLUMNS = %w(url created_at)
  SORT_COLUMNS = %w(asc desc)
  def index
  end

  def show
    @site = current_site
    sort = VALID_SORT_COLUMNS.include?(params[:sort]) ? params[:sort] : 'created_at'
    @direction = SORT_COLUMNS.include?(params[:direction]) ? params[:direction] : 'asc'
    @pvs = @site.pvs.order(sort + ' ' + @direction)
    @direction = @direction == 'asc' ? 'desc' : 'asc'
  end

end
