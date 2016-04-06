class AddPositionXToArts < ActiveRecord::Migration
  def change
    add_column :arts, :positionX, :integer
  end
end
