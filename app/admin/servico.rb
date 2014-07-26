ActiveAdmin.register Servico do

  ActiveAdmin.register Tarefa do
  end
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
   permit_params :valor_orcamento, :cliente_id, :tipo_servico, :observacao, :tipo_servico_executado, 
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

# Começo Show
  show do
    attributes_table do
      row "Valor do Orçamento" do |s|
        s.valor_orcamento
      end
      row :observacao, label: "Observação"
      panel "Servicos Executados" do

        table_for servico.tipo_servico_executados, label: "Serviçaasdos Executados" do


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
    
    active_admin_comments

  end
#  Fim Show


# Começo Sidebar
  sidebar "Tarefas", only: [:show] do
    ul do
      table_for servico.tarefas do
          column "Tarefa" do |tarefa|
            tarefa.titulo
          end
          column "Data" do |tarefa|
            data=tarefa.vencimento
            data.strftime("%d/%m/%Y")
          end
        end
      end
  end
# Fim Sidebar

# começo Form
  form do |f|
    f.inputs do

      # f.input :cliente_id, :label => 'Cliente', :as => :select, :collection => Cliente.all.map{|c| ["#{c.nome}", c.id]}
      f.input :valor_orcamento, label: 'Valor Orçamento', as: :string

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

      f.input :observacao, label: 'Observação'
    end
    f.actions
  end
# Fim Form

end


