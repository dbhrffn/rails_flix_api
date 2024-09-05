class CreateCredits < ActiveRecord::Migration[5.2]
  def change
    create_table :credits do |t|
      t.references :media, polymorphic: true
      t.references :actor

      t.string :role
      t.integer :order
      t.string :type

      t.timestamps
  end
end
end