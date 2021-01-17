class CreateCateNames < ActiveRecord::Migration[6.1]
  def change
    create_table :cate_names do |t|
      t.string :name
      t.string :description
      t.timestamps
    end
  end
end
