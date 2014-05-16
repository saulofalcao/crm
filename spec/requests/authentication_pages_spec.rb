require 'spec_helper'

describe "Authentication" do
	subject {page}
	describe "signin page" do
		before {visit signin_path}
		it { should have_content('Acessar') }
		it { should have_title('Acessar') }

		describe "with invalid information" do
			before {click_button "Acessar"}
			it { should have_title("Acessar") }
			it { should have_selector("div.alert.alert-error") }

			describe "depois visita outra pagina" do
				before { visit '/'}
				it { should_not have_selector('div.alert.alert-error') }
			end
		end

		describe "com informação válida" do
			let(:user) { FactoryGirl.create(:user) }
			before do
				fill_in "E-mail", with: user.email.upcase
				fill_in "Senha", with: user.password
				click_button "Acessar"
			end
			it { should have_title(user.nome) }
			it { should have_link('Perfil', href: user_path(user)) }
			it { should have_link('Sair', href: signout_path) }
			it { should_not have_link('Acessar', href: signin_path) }
		end
		
	end
end
