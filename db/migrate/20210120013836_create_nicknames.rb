class CreateNicknames < ActiveRecord::Migration[6.1]
  def change
    create_table :nicknames do |t|
      t.string :name
      t.string :description
      t.references :people

      t.timestamps
    end
  end
end
