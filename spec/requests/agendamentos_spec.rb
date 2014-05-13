require 'spec_helper'

describe "Testa Validade do modelo Agendamento" do
	describe "tenta criar agendamento com valores em branco" do

	    before do
    		@agendamento = Agendamento.new(data: "", hora: "")
    	end

    	subject {@agendamento}
    	# it {should respond_to(:paciente)}
    	it {should_not be_valid}
    end
    describe "Agendamento com valores validos" do
    	before do
    		@agendamento = Agendamento.new(data: "2014-06-01", hora: "1830")
    	end
    	subject {@agendamento}
    	it { should be_valid }
    end
    # describe "Testa relacionamento de Agendamento com modelo Medico" do
    # 	before do
    # 		@agendamento = Agendamento.new(data: "2014-06-01", hora: "1830", paciente: "")
    # 	end
    # end

	
end
