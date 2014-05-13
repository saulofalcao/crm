require 'spec_helper'

describe "Agendamentos" do
	describe "tenta criar agendamento com valores em branco" do

	    before do
    		@agendamento = Agendamento.new(paciente: "", data: "", hora: "", medico: "")
    	end

    	subject {@agendamento}
    	# it {should respond_to(:paciente)}
    	it {should_not be_valid}
    end
    describe "Agendamento com valores validos" do
    	before do
    		@agendamento = Agendamento.new(paciente: "João da Silva", data: "2014-06-01", hora: "1830", medico: "Pedro Arantes")
    	end
    	subject {@agendamento}
    	it { should be_valid }
    end
	
end
