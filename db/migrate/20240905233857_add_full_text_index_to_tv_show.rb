class AddFullTextIndexToTvShow < ActiveRecord::Migration[5.2]
  def change
    add_index :tv_shows, [:name, :overview], type: :fulltext
  end
end
