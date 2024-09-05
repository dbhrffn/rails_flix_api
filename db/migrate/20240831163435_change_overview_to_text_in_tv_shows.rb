class ChangeOverviewToTextInTvShows < ActiveRecord::Migration[5.2]
  def change
    change_column :tv_shows, :overview, :text
  end
end
