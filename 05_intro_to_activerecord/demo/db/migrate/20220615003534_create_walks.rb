class CreateWalks < ActiveRecord::Migration[6.1]
  def change
    create_table :walks do |t|
      t.datetime :time
      t.integer :dog_id
      t.foreign_key :dogs
      # t.belongs_to :dog, foreign_key: true
    end
  end
end
