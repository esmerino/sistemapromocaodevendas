class ConexaoController < ActionController::Base
	def status
		render :json => "true"
	end
end