require 'spec_helper'

describe "Testa Validade do modelo Agendamento" do
    let(:medico) { Medico.create!(nome: "Pedro Alves") }
    let(:paciente) { Paciente.create!(nome: "João da Silva") }
	describe "tenta criar agendamento com valores em branco" do

	    before do
          
    		@agendamento = paciente.agendamentos.create(data: "", hora: "", 
                                medico_id: medico.id)

    	end

    	subject {@agendamento}
    	# it {should respond_to(:paciente)}
    	it {should_not be_valid}
    end
    describe "Agendamento com valores validos" do
    	before do
    		@agendamento = paciente.agendamentos.create(data: "2014-06-01", hora: "1830",
                            medico_id: medico.id)

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
