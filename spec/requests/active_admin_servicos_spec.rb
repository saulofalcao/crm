require 'spec_helper'

describe "ActiveAdminServicos" do
  describe "GET /admin/servicos nao deve funcionar" do
    it "nao deve funcionar" do
    	admin=User.find_by(email: "admin@example.com")
    	login(admin)
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get "http://127.0.0.0:3000/admin/servicos/1/tarefas"
      response.status.should be(200)
    end
  end
end
