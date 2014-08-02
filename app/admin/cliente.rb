ActiveAdmin.register Cliente do
  # ActiveAdmin.register Servico do
  #   belongs_to  :cliente

  # end
# collection_action :import_csv, method: :get do
#       # Do some CSV importing work here...
#   redirect_to collection_path, notice: "CSV imported successfully!"
# end

  # Começo Sidebar
  sidebar "Tarefas", only: [:show] do
    ul do
      table_for cliente.tarefas do
        column "Tarefa" do |tarefa|
          tarefa.titulo
        end
        column "Data" do |tarefa|
          data=tarefa.vencimento
          data.strftime("%d/%m/%Y")
        end
      end
      li link_to "Nova Tarefa", new_admin_cliente_tarefa_path(params[:id])
    end
  end
  # Fim Sidebar


  # scope :all
  # scope :pending

  # controller do
  #   def import_csv
  #     render 'tarefas'
  #   end
  # end
  action_item only: [:show] do |cliente|
    link_to "Novo Serviço", new_admin_cliente_servico_path(params[:id])
  end
  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  permit_params :nome, :email, :rua, :numero, :complemento, :bairro, :cep, :observacao
  #has_many :servicos

  form do |f|
    f.inputs do
       f.input :nome
       f.input :email, label: "E-mail"
       f.input :rua
       f.input :numero, label: "Número"
       f.input :complemento
       f.input :bairro
       f.input :cep
       f.input :observacao, label: "Observação"
    end
    f.actions
  end


  sidebar "Servicos", only: [:show, :edit] do
    ul do
      li link_to "Servicos",    admin_cliente_servicos_path(cliente)
      

    end

  end
 


  index do |cliente| 
    # id_column
    selectable_column
    column :nome do |cliente|
      link_to cliente.nome, admin_cliente_path(cliente)
    end
  

    column :email do |cliente|
      link_to cliente.email, admin_cliente_path(cliente)
    end
    column :rua
    column :numero
    column :bairro
    actions
    # link_to "Novo Serviço", new_admin_cliente_servico_path(cliente.nome)
    # link_to "Novo Serviço", "#{cliente.nome}" 
  end

  index as: :grid do |cliente|
    # link_to image_tag(product.image_path), admin_product_path(product)
    link_to cliente.nome, admin_cliente_path(cliente)
  end

end
