# unit18 新規作成
class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      # unit18 string型のname、emailカラムを作成
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
