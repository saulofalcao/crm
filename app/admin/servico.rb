ActiveAdmin.register Servico do

  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
   permit_params :valor_orcamento, :cliente_id, :tipo_servico
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
  form do |f|
    f.inputs do
      f.input :cliente_id, :label => 'Cliente', :as => :select, :collection => Cliente.all.map{|c| ["#{c.nome}", c.id]}
      f.input :valor_orcamento, label: 'Valor Orçamento', as: :string
      f.input :tipo_servico, label: 'Tipo de Serviço', as: :check_boxes, collection: TipoServico.all.map{ |t| ["#{t.tipo_servico}", t.id]}
    end
    f.actions
  end

end
