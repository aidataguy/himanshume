class AddUrlToDesigns < ActiveRecord::Migration
  def change
  	add_column :designs, :url, :string
  	add_index :designs, :url
  end
end
