class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.column :name, :string
      t.column :nis, :integer
      t.column :address, :string
      t.timestamps
    end
  end
end
