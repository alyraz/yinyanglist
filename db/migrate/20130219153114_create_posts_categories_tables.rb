class CreatePostsCategoriesTables < ActiveRecord::Migration
  
  def change
    create_table :posts do |p|
      p.string      :title 
      p.text        :description
      p.string      :email
      p.float       :price
      p.string      :image_url
      p.string      :unique_key 
      p.integer     :category_id
      p.timestamps
    end 

    create_table :categories do |c|
      c.string    :name
      c.timestamps
    end 
  end

end
