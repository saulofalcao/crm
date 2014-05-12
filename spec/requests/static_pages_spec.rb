require 'spec_helper'

describe "StaticPages" do

  describe "Home Page - StaticPages#home" do
    it "deve conter no título 'Finanças'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      # get static_pages_index_path
      # response.status.should be(200)
    	visit '/static_pages/home'
    	page.should have_title("Finanças")
    end
    it "deve conter o link de Acessar no menu superior" do
      visit '/'
      page.should have_link("Acessar")
    end

  end

  describe "Página Ajuda  - static_pages/ajuda" do
    it "deve ter o conteúdo Ajuda" do
      visit '/static_pages/ajuda'
      expect(page).to have_content('Ajuda')
    end

  end
end
