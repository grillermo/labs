class MigrateCateNamesToNicknames < ActiveRecord::Migration[6.1]
  def up
    cate = Person.find_or_create_by(name: 'cat-e')
    CateName.all.each do |cate_name|
      Nickname.create!(person: cate, name: cate_name.name)
    end
  end

  def down
  end
end
