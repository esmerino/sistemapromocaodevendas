class CreateFuncionarios < ActiveRecord::Migration
  def change
    create_table :funcionarios do |t|
      t.string :nome
      t.string :login
      t.string :senha

      t.timestamps
    end
  end
end
