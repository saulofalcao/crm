require 'spec_helper'

describe "Testa Validade do modelo Paciente" do
  describe "com dados em branco" do
  	before do
  		@paciente = Paciente.new(nome: "")
  	end
  	subject {@paciente}

  	it { should_not be_valid}

  end
  describe "com dados validos" do
  	before do
  		@paciente = Paciente.new(nome: "João da Silva Sauro")
  	end
  	subject {@paciente}

  	it { should be_valid}
  end
  
end
