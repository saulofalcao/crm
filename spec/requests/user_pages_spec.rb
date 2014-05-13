require 'spec_helper'

describe "User pages" do

	subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_content('Cadastre-se') }
    it { should have_title(full_title('Cadastre-se')) }

    # testa clicar no submit sem nenhum input
    let(:submit) { "Cadastrar" } 
    describe "com informação invalida" do
      it "não deve criar um usuário" do
        expect {click_button submit}.not_to change(User, :count)
      end
    end

    describe "Com informação valida" do
      before do
        fill_in "Nome",  with: "Example User"
        fill_in "E-mail",  with: "user2@example.com"
        fill_in "Senha",  with: "foobar"
        fill_in "Confirmação da Senha",  with: "foobar"
      end
      it "deve criar um usuario" do
        expect{click_button submit}.to change(User, :count).by(1)

      end
      describe "depois de salvar o usuario" do
        before {click_button submit}
        let(:user) {User.find_by(email: 'user2@example.com')}
        it { should_not have_link('Acessar', href: signin_path) }
        it { should have_title(user.nome) }
        it { should have_selector("div.alert.alert-success") }
       
        # it { should_not have_link('Sair', href: signout_path) }

      end
    end

  end
end
describe "Página de Perfil" do
  subject {page}
# 		# Replace with code to make a user variable
#     let(:user) { FactoryGirl.create(:user) }
#     before { visit user_path(user) }

#     it { should have_content(user.nome) }
#     it { should have_title(user.nome) }
  let(:user) { FactoryGirl.create(:user)}
  before do
    visit signin_path
    fill_in "E-mail", with: user.email
    fill_in "Senha", with: user.password
    click_button "Acessar"
    #visit user_path(user)
  end
  

  it { should have_content(user.nome) }
  it { should have_title(user.nome) }
  it { should_not have_link('Acessar', href: signin_path) }
  it { should have_link('Sair', href: signout_path) }

  describe "Clicando em sair a sessão deve ser excluida" do
    let(:usuario_banco) { User.find_by(email: user.email) }
    let(:token) { cookies[:remember_token]}
    before do
      click_link 'Sair'
    end
    it { should have_link('Acessar', href: signin_path) }
    it { should_not have_link('Sair', href: signout_path) }

    describe "Testa o roubo do cookie. Mesmo clicando em Sair, se
              eu setar novamente o cookie, ele não deve se logar,
              pois deve ter sido gerado um novo token no banco" do
      before do
        cookies[:remember_token]=token
        visit user_path(user)
      end
      # it { should have_link('Acessar', href: signin_path) }
      # it { should_not have_link('Sair', href: signout_path) }
      it { should_not have_title(user.nome) }
      it ", ainda implementando" do
        pending "Não era para passar esse teste ainda"
      end

    end

    

  end
end





