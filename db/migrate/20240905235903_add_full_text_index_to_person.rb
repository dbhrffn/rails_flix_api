class AddFullTextIndexToPerson < ActiveRecord::Migration[5.2]
  def change
    add_index :people, [:name], type: :fulltext
  end
end
