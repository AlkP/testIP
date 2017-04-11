class CreateTesteds < ActiveRecord::Migration
  def change
    create_table :testeds do |t|
      t.references  :address,   null: false,  index: true
      t.datetime    :test_in,   null: false
      t.float       :duration,  null: false
    end
  end
end
