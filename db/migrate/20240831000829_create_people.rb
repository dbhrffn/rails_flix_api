class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
        t.integer :tmdb_id, index: true
  
        t.string :name, index: true
        t.integer :gender, default: 0
  
        t.string :profile_path
  
        t.timestamps
    end
  end
end
