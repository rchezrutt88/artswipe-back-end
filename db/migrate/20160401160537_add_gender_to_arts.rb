class AddGenderToArts < ActiveRecord::Migration
  def change
    add_column :arts, :gender, :string
  end
end
