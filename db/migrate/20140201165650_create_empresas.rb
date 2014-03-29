class CreateEmpresas < ActiveRecord::Migration
  def change
    create_table :empresas do |t|
      t.string :nome_fantasia

      t.timestamps
    end
  end
end
