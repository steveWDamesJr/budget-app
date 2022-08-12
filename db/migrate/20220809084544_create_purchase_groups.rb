class CreatePurchaseGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :purchase_groups do |t|

      t.timestamps
    end
  end
end
