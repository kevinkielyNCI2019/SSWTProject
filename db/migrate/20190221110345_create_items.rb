class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :albumtitle
      t.string :albumartist
      t.text :albumdesc
      t.decimal :albumprice
      t.string :albumgenre
      t.string :albumformat
      t.string :albumart

      t.timestamps
    end
  end
end
