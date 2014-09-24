ActiveAdmin.register Oportunidade do
# actions: false
  #menu false
  config.filters = false
  config.clear_action_items!

  scope :ativas
  scope :inativas

  permit_params :ativa, :tipo_servico_id, :cliente_id, :observacao

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
  # controller do
  #   # def scoped_collection
  #   #   # Oportunidade.ativas
  #   # end


  # end
  # scope_to do
  #   Oportunidade.ativas
  # end
  controller do
    # def index
    #   @oportunidades = Oportunidade.ativas
    #   index!
    # end
    def scoped_collection
      end_of_association_chain.includes(:cliente, :tipo_servico)
      # Oportunidade.ativas
      # end_of_association_chain.includes(:tipo_servico)
    end
    def create
      create! do |format|
        format.html { redirect_to admin_oportunidades_path }
      end
    end
    def update
      update! do |format|
        format.html { redirect_to admin_oportunidades_path}
      end
    end
    # def destroy
    #   destroy! do |format|
    #     format.html { 
    #       redirect_to :back, notice: "O servico com id: #{params[:id]} foi excluído com sucesso"
    #     }
    #   end
    # end

  end

  index do
    column "Id", :id
    column "Data", sortable: 'oportunidades.created_at' do |oportunidade|

      simple_format oportunidade.created_at.strftime("%d/%m/%Y")
      # simple_format o
    end
    # column "Data Garantia", :data_garantia
    column "Cliente", sortable: 'clientes.nome' do |oportunidade|
      cliente = Cliente.where(id: oportunidade.cliente_id).first #, sortable: 'clientes.nome'
      cliente_nome =  cliente ? cliente.nome : "Nenhum"
    end
    column "Tipo de Serviço", sortable: 'tipo_servicos.nome' do |oportunidade|
      tipo_servico = TipoServico.where(id: oportunidade.tipo_servico_id).first #, sortable: 'clientes.nome'
      tipo_servico_nome =  tipo_servico ? tipo_servico.nome : "Nenhum"
    end
    column "Ativa?", :ativa
    # column "Orçamento", :valor_orcamento
    column "Observação", :observacao

    # actions :all, except: [:destroy]
    # actions
    # actions :defaults: false
    # column "" do |oportunidade|
      # link_to "Visualizar", admin_oportunidade_path(oportunidade.id)
    # end

    # column "" do |oportunidade|
      # link_to "Editar", edit_admin_oportunidade_path(oportunidade.id)
    # end
    actions defaults: false do |oportunidade|
      link_to 'Visualizar', admin_oportunidade_path(oportunidade.id) 
    end
    actions defaults: false do |oportunidade|
      link_to 'Editar', edit_admin_oportunidade_path(oportunidade.id)
    end

    # actions defaults: false do |oportunidade|
    #   link_to "Editar", edit_admin_oportunidade_path(oportunidade.id)
    # end


    
  end

  # Começo edit e new
  # update do
  #   column "Cliente" do
  #     panel "Oi" do
  #     end
  #   end
  # end


  form do |f|
    # h1 "Teste" do
    # end
    # content do
    #   panel "Teste" do
    #     simple_format "Oi"
    #   end
    # end
    
    f.inputs "Cliente" do |oportunidade|
      if f.object.new_record?
        f.input :cliente, as: :select, label: "Cliente", collection:  Cliente.all.map { |c| [c.nome, c.id]}  , 
              include_blank: false
      else
        f.input :cliente, label: "Cliente", collection: Cliente.all.map { |c| [c.nome, c.id] }, input_html:  {disabled: true}
      end
    end
    # f.inputs "Data do Serviço" do 
    #   f.input :data_execucao, label: "Data de Execução", as: :date_picker
    #   f.input :data_garantia, label: "Vencimento da Garantia", as: :date_picker
    # end

    f.inputs "Tipo de Serviço" do
    

      if f.object.new_record?
        f.input :tipo_servico, label: "Tipo de Serviço", collection: TipoServico.all.map { |ts| [ ts.nome, ts.id]} 
          # tipo_servico.input :tipo_servico, label: "Tipo de Serviço", collection: TipoServico.all.map { |ts| [ "#{ts.nome}", ts.id]}
          # tse.input :_destroy, :as=>:boolean, :required => false, :label=>'Remover' 
        # end
      else
        # f.has_many :tipo_servicos do |tipo_servico|
          # tipo_servico.input :tipo_servico, label: "Tipo de Serviço", collection: TipoServico.all.map { |ts| [ "#{ts.nome}", ts.id]}
          # tipo_servico.input :_destroy, :as=>:boolean, :required => false, :label=>'Remover'
        # end
        f.input :tipo_servico, label: "Tipo de Serviço", input_html: {disabled: true}
      end
    end
    # f.inputs "Orçamento" do
    #   f.input :valor_orcamento, label: 'Valor Orçamento', as: :string
    # end
    # f.
    f.inputs "Ativa?" do
      # column "Ativa?" do |oportunidade|
      # oportunidade=Oportunidade.find(params[:id])

      if f.object.ativa
        f.input :ativa, label: 'Está ativa?', input_html: {checked: 'checked'}
      else
        f.input :ativa, label: 'Está ativa?'
      end
    # end
    end

    f.inputs "Observação" do
      f.input :observacao,  label: 'Observação'
    end

      # if f.object.new_record?
        # f.has_many :tarefas do |tarefa|
          # tarefa.input :tarefa, label: "Tarefa"
        # end
      # end
    
    f.actions
  end
  # fim edit e new



end
