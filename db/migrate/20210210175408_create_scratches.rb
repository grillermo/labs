class CreateScratches < ActiveRecord::Migration[6.1]
  def change
    create_table :scratches do |t|
      t.text :content
      t.timestamps
    end
  end
end
