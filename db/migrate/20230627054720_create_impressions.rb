class CreateImpressions < ActiveRecord::Migration[7.0]
  def change
    create_table :impressions do |t|
      t.references :impressionable, polymorphic: true, null: false
      
      t.timestamps
    end
  end
end
