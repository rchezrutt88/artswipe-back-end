class AddWidthToArts < ActiveRecord::Migration
  def change
    add_column :arts, :width, :integer
  end
end
