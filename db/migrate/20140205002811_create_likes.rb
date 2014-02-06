class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.string :kind
      t.references :user, index: true
      t.references :photo, index: true

      t.timestamps
    end
  end
end
