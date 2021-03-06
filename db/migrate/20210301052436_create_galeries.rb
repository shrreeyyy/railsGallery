class CreateGaleries < ActiveRecord::Migration[6.1]
  def change
    create_table :galeries do |t|
      t.string :gallery_title
      t.text :description
      t.string :email
      t.boolean :published

      t.timestamps
    end
  end
end
