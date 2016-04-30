class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
    	t.string :title
    	t.text :description
    	t.text :excerpt
    	t.timestamp :created_at
    	t.timestamp :updated_at
    end
  end
end
