ActiveAdmin.register Servico do

  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
   permit_params :valor_orcamento, :cliente_id, :tipo_servico, :tipo_servico_executado, tipo_servico_executados_attributes: [:tipo_servico_id]
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

  show do
    attributes_table do
      row "Valor do Orçamento" do |s|
        s.valor_orcamento
      end
    end
    panel "Servicos Executados" do

      table_for servico.tipo_servico_executados do
       
       column "" do |servico_executado| 
        if servico_executado.tipo_servico
          servico_executado.tipo_servico.nome
        end
      end
#         tipo_servico.tipo_servico.tipo_servico
#         # column tipo_de_servico.tipo_servico
        # end
#       column :tipo_servico
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      # f.input :cliente_id, :label => 'Cliente', :as => :select, :collection => Cliente.all.map{|c| ["#{c.nome}", c.id]}
      f.input :valor_orcamento, label: 'Valor Orçamento', as: :string
      f.has_many :tipo_servico_executados do |tse|
        # tse.input :tipo_servico_executado, label: 'Tipo de Serviço', as: :check_boxes, collection: TipoServico.all.map{ |t| ["#{t.nome}", t.id]}
        tse.input :tipo_servico, label: "Tipo de Serviço", collection: TipoServico.all.map { |ts| [ "#{ts.nome}", ts.id]}
      end
    end
    f.actions
  end


end
