class ConvertCreditsToPeople < ActiveRecord::Migration[5.2]
  def change
    rename_column :credits, :actor_id, :person_id

    Credit.update_all(type: "ActingCredit")
  end
end
