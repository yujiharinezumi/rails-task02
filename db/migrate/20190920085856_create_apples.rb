class CreateApples < ActiveRecord::Migration[5.2]
  def change
    create_table :apples do |t|
      t.string :name
      t.string :title
      t.text :content
    end
  end
end
