class ReportsController < ApplicationController
  # ソート方法とソート対象の定義
  VALID_SORT_COLUMNS = %w(url created_at)
  SORT_COLUMNS = %w(ASC DESC)
  def index
  end

  def show
    @site = current_site
    @pvs = @site.pvs
    @sort_start = params[:start_date] ? params[:start_date] : ''
    @sort_end = params[:end_date] ? params[:end_date] : ''

    # デフォルトは今日の日付
    @start = !params[:start_date].blank? ? params[:start_date] : Time.zone.now.strftime("%Y-%m-%d")
    @end = !params[:end_date].blank? ? params[:end_date] : Time.zone.now.strftime("%Y-%m-%d")

    # 日付の始点・終点が逆の場合
    @start, @end = @end, @start if @start > @end

    # 期間指定されたpvsの集計
    if !params[:start_date].blank? || !params[:end_date].blank?
      @pvs = @pvs.where(created_at: (@start.in_time_zone)..(@end.in_time_zone + 1.day))
      if @pvs.count == 0
        flash.now[:alert] = '指定された期間にデータはありませんでした。'
        @pvs = @site.pvs
      else
        @text = '指定期間で'
      end
    end

    # デフォルトはアクセス日時・降順
    sort = VALID_SORT_COLUMNS.include?(params[:sort]) ? params[:sort] : 'created_at'
    @direction = SORT_COLUMNS.include?(params[:direction]) ? params[:direction] : 'DESC'

    # ソート対象とソート方法の指定
    @pvs = @pvs.order(sort + ' ' + @direction)

    # ビューの昇順・降順の入れ替え
    @direction = @direction == 'ASC' ? 'DESC' : 'ASC'
  end

end
