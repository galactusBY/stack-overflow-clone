class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer :shaka
      t.references :user, foreign_key: true, index:true
      t.integer :voteable_id
      t.string :voteable_type

      t.timestamps
    end
    add_index :votes, [:voteable_type, :voteable_id]
  end
end
