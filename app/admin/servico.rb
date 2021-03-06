ActiveAdmin.register Servico  do
  # belongs_to  :cliente
  # ActiveAdmin.register Tarefa do
  # end
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  config.filters = false
  config.clear_action_items!
   permit_params :valor_orcamento, :cliente_id, :tipo_servico, :observacao, :tipo_servico_executado, 
   :data_execucao, :data_garantia,
   tipo_servico_executados_attributes: [:tipo_servico_id, :id, :_destroy]

  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  # belongs_to  :cliente
  # navigation_menu :cliente
  controller do
    def create
      create! do |format|
        format.html { redirect_to admin_cliente_path(params[:servico][:cliente_id]) }
      end
    end
    def update
      update! do |format|
        format.html { redirect_to admin_cliente_path(params[:servico][:cliente_id])}
      end
    end
    def destroy
      destroy! do |format|
        format.html { 
          redirect_to :back, notice: "O servico com id: #{params[:id]} foi excluído com sucesso"
        }
      end
    end

    def scoped_collection
      end_of_association_chain.includes(:cliente)
    end
  end
# Começo Index
index do
  column "Id", :id
  column "Data", :data_execucao
  column "Data Garantia", :data_garantia
  column "Cliente", sortable: 'clientes.nome' do |servico|
    cliente = Cliente.where(id: servico.cliente_id).first #, sortable: 'clientes.nome'
    cliente_nome =  cliente ? cliente.nome : "Nenhum"
  end
  column "Orçamento", :valor_orcamento
  column "Observação", :observacao

  actions
  # actions :defaults: false
end
# Fim Index



# Começo Show
  show do
    attributes_table do
      row "Valor do Orçamento" do |s|
        s.valor_orcamento
      end
      row "Observação" do |s|
        s.observacao
      end
      panel "Servicos Executados" do

        table_for servico.tipo_servico_executados, label: "Serviços Executados" do


          column "" do |servico_executado| 
            if servico_executado.tipo_servico
              servico_executado.tipo_servico.nome
            end
          end
        end
      end
      # panel "Tarefas" do
      #   table_for servico.tarefas do
      #     column "Tarefa" do |tarefa|
      #       tarefa.titulo
      #     end
      #     column "Data" do |tarefa|
      #       data=tarefa.vencimento
      #       data.strftime("%d/%m/%Y")
      #     end
      #   end
      # end

    end
    
    # active_admin_comments

  end
#  Fim Show




# começo Form
  form do |f|
    f.inputs "Cliente" do |servico|
      if f.object.new_record?
        f.input :cliente, as: :select, label: "Cliente", collection:  [[Cliente.find(params[:cliente_id]).nome, params[:cliente_id] ] ], 
              include_blank: false
      else
        f.input :cliente, label: "Cliente", collection: Cliente.all.map { |c| [c.nome, c.id] }
      end
    end
    f.inputs "Data do Serviço" do 
      f.input :data_execucao, label: "Data de Execução", as: :date_picker
      f.input :data_garantia, label: "Vencimento da Garantia", as: :date_picker
    end

    f.inputs "Tipo de Serviço Executado" do
    

      if f.object.new_record?
        f.has_many :tipo_servico_executados do |tse|
          tse.input :tipo_servico, label: "Tipo de Serviço", collection: TipoServico.all.map { |ts| [ "#{ts.nome}", ts.id]}
          # tse.input :_destroy, :as=>:boolean, :required => false, :label=>'Remover' 
        end
      else
        f.has_many :tipo_servico_executados do |tse|
          tse.input :tipo_servico, label: "Tipo de Serviço", collection: TipoServico.all.map { |ts| [ "#{ts.nome}", ts.id]}
          tse.input :_destroy, :as=>:boolean, :required => false, :label=>'Remover'
        end
      end
    end
    f.inputs "Orçamento" do
      f.input :valor_orcamento, label: 'Valor Orçamento', as: :string
    end

    f.inputs "Observação" do
      f.input :observacao, label: 'Observação'
    end

      # if f.object.new_record?
        # f.has_many :tarefas do |tarefa|
          # tarefa.input :tarefa, label: "Tarefa"
        # end
      # end
    
    f.actions
  end
# Fim Form

end


