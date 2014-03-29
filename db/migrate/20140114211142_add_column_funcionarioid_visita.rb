class AddColumnFuncionarioidVisita < ActiveRecord::Migration
  def up
  	add_column :visita, :funcionario_id, :integer
  end

  def down
  	remove_column :visita, :funcionario_id
  end
end
