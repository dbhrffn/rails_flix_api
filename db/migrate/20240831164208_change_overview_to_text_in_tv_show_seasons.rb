class ChangeOverviewToTextInTvShowSeasons < ActiveRecord::Migration[5.2]
  def change
    change_column :tv_show_seasons, :overview, :text
  end
end
