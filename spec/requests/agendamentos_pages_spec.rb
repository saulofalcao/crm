require 'spec_helper'

describe "Testa a página de novo Agendamento" do 
	before do
		visit new_agendamento_path
	end
	subject {page}

	it { should have_title("Novo Agendamento") }
	
end