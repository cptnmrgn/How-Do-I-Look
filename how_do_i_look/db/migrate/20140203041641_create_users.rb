class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.text :picture
      t.text :blurb
      t.string :location

      t.timestamps
    end
  end
end
