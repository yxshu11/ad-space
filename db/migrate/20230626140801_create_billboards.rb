class CreateBillboards < ActiveRecord::Migration[7.0]
  def change
    create_table :billboards do |t|
      t.string :name
      t.string :path
      t.integer :targetted_impressions, default: 0
      t.boolean :activated, default: false
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
