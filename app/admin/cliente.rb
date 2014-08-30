ActiveAdmin.register Cliente do
  # ActiveAdmin.register Servico do
  #   belongs_to  :cliente

  # end
# collection_action :import_csv, method: :get do
#       # Do some CSV importing work here...
#   redirect_to collection_path, notice: "CSV imported successfully!"
# end

  config.filters = false



  # # Começo Sidebar Tarefas
  # sidebar "Tarefas", only: [:show] do
  #   ul do
  #     table_for cliente.tarefas do
  #       column "Tarefa" do |tarefa|
  #         tarefa.titulo
  #       end
  #       column "Data" do |tarefa|
  #         data=tarefa.vencimento
  #         data.strftime("%d/%m/%Y")
  #       end
  #     end
  #     li link_to "Nova Tarefa", new_admin_cliente_tarefa_path(params[:id])
  #   end
  # end
  # # Fim Sidebar


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
  permit_params :nome, :email, :rua, :complemento, :bairro, :cep, :observacao
  #has_many :servicos

  form do |f|
    f.inputs do
       f.input :nome
       f.input :telefone
       f.input :email, label: "E-mail"
       f.input :endereco
       f.input :complemento
       f.input :bairro
       f.input :cep
       f.input :observacao, label: "Observação"
    end
    f.actions
  end


  # sidebar "Servicos", only: [:show, :edit] do
  #   ul do
  #     table_for cliente.servicos do
  #       column "Orçamento" do |servico|
  #         servico.valor_orcamento
  #       end
  #       # column "Observação" do |servico|
  #       #   servico.observacao
  #       # end
  #       column "Serviços" do |servico|
  #         ul do
  #           servico.tipo_servicos.each do |ts|
  #             li ts.nome

  #           end
  #         end
  #       end
  #       column "Editar" do |servico|
  #         link_to "Editar", edit_admin_cliente_servico_path(servico.cliente_id,servico.id)
  #       end



  #         # table_for servico.tipo_servicos do
  #           # column do |tipo_servico
  #     end

  #     li link_to "Novo Serviço",    new_admin_cliente_servico_path(cliente)
      

  #   end

  # end

  


 


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
    column :bairro
    actions
    # link_to "Novo Serviço", new_admin_cliente_servico_path(cliente.nome)
    # link_to "Novo Serviço", "#{cliente.nome}" 
  end

  # index as: :grid do |cliente|
    # link_to image_tag(product.image_path), admin_product_path(product)
    # link_to cliente.nome, admin_cliente_path(cliente)
  # end


  # show do
  #   h3 cliente.nome
  # end
  show title: :nome do
      attributes_table do
        row "Nome" do 
          cliente.nome
        end
        row "Telefone" do
          cliente.telefone
        end
        row "E-mail" do
          cliente.email
        end
        row "Endereço" do
          cliente.endereco
        end
        row "Complemento" do
          cliente.complemento
        end
        row "Bairro" do
          cliente.bairro
        end
        row "CEP" do
          cliente.cep
        end
        row "Observação" do
          cliente.observacao
        end
      end


      panel "Servicos", only: [:show, :edit] do
        ul do
          table_for cliente.servicos.order(created_at: :desc) do
            column "Orçamento" do |servico|
              servico.valor_orcamento
            end
            # column "Observação" do |servico|
            #   servico.observacao
            # end
            column "Serviços" do |servico|
              # ul do
              tem_tipo_servico = servico.tipo_servicos.count
              servico.tipo_servicos.each do |ts|
                  
                  tem_tipo_servico=tem_tipo_servico - 1
                  if tem_tipo_servico > 0
                    span ts.nome + ", "
                  else
                    span ts.nome  
                  end
              end
              
            end
            column "Observação" do |servico|
              servico.observacao
            end

            
            column "" do |servico|
              link_to "Editar", edit_admin_cliente_servico_path(servico.cliente_id,servico.id)
            end



              # table_for servico.tipo_servicos do
                # column do |tipo_servico
          end

          div link_to "Novo Serviço",    new_admin_cliente_servico_path(cliente)
          

        end

      end


    # active_admin_comments
  end


end
