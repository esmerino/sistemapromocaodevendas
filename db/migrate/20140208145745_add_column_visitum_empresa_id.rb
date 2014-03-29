class AddColumnVisitumEmpresaId < ActiveRecord::Migration
  def up
  	remove_column :visita, :empresa
  	add_column :visita, :empresa_id, :integer
  end

  def down
  	add_column :visita, :empresa, :string
  	remove_column :visita, :empresa_id
  end
end
