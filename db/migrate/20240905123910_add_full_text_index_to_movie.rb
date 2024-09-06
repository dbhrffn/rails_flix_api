class AddFullTextIndexToMovie < ActiveRecord::Migration[5.2]
  def change
    # Add a full-text index to the specified columns
    add_index :movies, [:title, :tagline, :overview], type: :fulltext
  end
end