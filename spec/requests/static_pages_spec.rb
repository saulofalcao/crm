require 'spec_helper'

describe "StaticPages" do
  subject {page}

  describe "Home Page - StaticPages#home" do
    before { visit '/static_pages/home' }


    it { should have_title("Agendamento Médico") }
    it { should have_text("Agendamento Médico") }
    #it { should have_text('Bem Vindo ao Sistema de Reservas') }
    it { should have_link("Acessar") }
   # it { should have_button('Acessar') }
  end

  describe "Página Ajuda  - static_pages/ajuda" do
    before { visit '/static_pages/ajuda' }

    it { should have_content('Ajuda') }
  end

end

