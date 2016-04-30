class CreateDesigns < ActiveRecord::Migration
  def change
    create_table :designs do |t|
    	t.string :name
    	t.text	:design_description
    end
  end
end
