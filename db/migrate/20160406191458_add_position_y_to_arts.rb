class AddPositionYToArts < ActiveRecord::Migration
  def change
    add_column :arts, :positionY, :integer
  end
end
