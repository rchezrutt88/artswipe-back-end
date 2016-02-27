class CreateArts < ActiveRecord::Migration
  def change
    create_table :arts do |t|
      t.string :author
      t.string :born_died
      t.string :title
      t.string :date
      t.string :technique
      t.string :location
      t.string :url
      t.string :form
      t.string :style
      t.string :school
      t.string :timeframe

      t.timestamps null: false
    end
  end
end
