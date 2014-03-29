class Funcionario < ActiveRecord::Base
  attr_accessible :login, :nome, :senha
  has_many :visitum

  before_save :uppercase_icao
  def uppercase_icao
    self.login.upcase!
    self.nome.upcase!
  end
end
