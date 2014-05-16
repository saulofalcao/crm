require 'spec_helper'

<<<<<<< HEAD
describe "Fazer testes da Página de agendamento" do
# it "fazer testes da pagina de agendamento" do
	# pending "reason"
# end
	pending ""
end


=======
describe "Testa a página de novo Agendamento" do 
	before do
		visit new_agendamento_path
	end
	subject {page}

	it { should have_title("Novo Agendamento") }
	
end
>>>>>>> db2dde4a9814bf06fe12bb7ae7ffcb7e1c9f9040
