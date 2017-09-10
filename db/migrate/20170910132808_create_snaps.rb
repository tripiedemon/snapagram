class CreateSnaps < ActiveRecord::Migration[5.1]
  def change
    create_table :snaps do |t|
      t.string :url
      t.text :caption
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
