require 'spec_helper'

describe "Testa Validade do modelo Medico" do
  describe "com dados em branco" do
  	before do
  		@medico = Medico.new(nome: "")
  	end
  	subject {@medico}

  	it { should_not be_valid}

  end
  describe "com dados validos" do
  	before do
  		@medico = Medico.new(nome: "João da Silva Sauro")
  	end
  	subject {@medico}

  	it { should be_valid}
  end
end
