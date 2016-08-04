class CreateBids < ActiveRecord::Migration[5.0]
  def change
    create_table :bids do |t|
      t.float :amount
      t.references :job, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :chosen_bid

      t.timestamps
    end
    add_index :bids, [:job_id, :created_at]

  end
end
