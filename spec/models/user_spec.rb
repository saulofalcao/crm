# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  nome            :string(255)
#  email           :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  password_digest :string(255)
#  remember_token  :string(255)
#

require 'spec_helper'

describe User do
	before { 
		@user = User.new(nome: "Example User", email: "user@exemplo.com.br",
			password: "blabla", password_confirmation: "blabla") 
	}

	subject { @user }
	it { should respond_to(:nome) }
	it { should respond_to(:email) }
	it { should respond_to(:password_digest) }
	it { should respond_to(:password_confirmation) }
	it { should respond_to(:remember_token) }
	it { should respond_to(:authenticate) }

	it { should be_valid }

	describe "quando o nome não estiver presente" do
		before { @user.nome = " " }
		it { should_not be_valid }
	end

	describe "quando o email nao estiver presente" do
		before { @user.email = " " }
		it { should_not be_valid }
	end

	

	describe "Quando o nome for muito longo" do
		before { @user.nome = "a" * 51 }
		it { should_not be_valid }
	end


	describe "quando o formato do email for invalido" do
		it "deve ser invalido" do
			addresses = %w[user@foo,com user_at_foo.org example.user@foo.
				foo@bar_baz.com foo@bar+baz.com]
				addresses.each do |invalid_address|
					@user.email = invalid_address
					expect(@user).not_to be_valid
				end
		end
	end

	describe "quando o formato do email e valido" do
		it "deve ser valido" do
			addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
			addresses.each do |valid_address|
					@user.email = valid_address
					expect(@user).to be_valid
			end
		end
	end


	describe "quando o endereco de email ja foi inserido" do
	    before do
	      user_with_same_email = @user.dup
	      user_with_same_email.email = @user.email.upcase
	      user_with_same_email.save
	    end

	    it { should_not be_valid }
 	end
	describe "quando a senha nao estiver presente 2" do
  		before do
    		@user = User.new(nome: "Example User", email: "user@example.com",
                     password: " ", password_confirmation: " ")
  		end
  		it { should_not be_valid }
	end

	describe "retorna o valor do metodo de autenticacao" do
		before { @user.save }
		let(:found_user) { User.find_by(email: @user.email) }

		describe "com uma senha valida" do
	    	it { should eq found_user.authenticate(@user.password) }
	  	end

	  	describe "com uma senha invalida" do
			let(:user_for_invalid_password) { found_user.authenticate("invalid") }

	    	it { should_not eq user_for_invalid_password }
	    	specify { expect(user_for_invalid_password).to be_false }
	  	end
	end

	describe "com uma senha muito curta" do
  		before { @user.password = @user.password_confirmation = "a" * 5 }
  		it { should be_invalid }
	end

	describe "remember_token" do
		before { @user.save }
		its(:remember_token) { should_not be_blank }
	end
	

end
