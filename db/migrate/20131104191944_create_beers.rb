class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.string :brand
      t.string :obdb_id

      t.timestamps
    end
  end
end
