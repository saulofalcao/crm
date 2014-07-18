ActiveAdmin.register Cliente do
  ActiveAdmin.register Servico do
    belongs_to  :cliente
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
  permit_params :nome, :email, :rua, :numero, :bairro, :cep, :complemento
  #has_many :servicos

  form do |f|
    f.inputs do
       f.input :nome
       f.input :email
       f.input :rua
       f.input :numero
       f.input :complemento
       f.input :bairro
       f.input :cep
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
  end

  index as: :grid do |cliente|
    # link_to image_tag(product.image_path), admin_product_path(product)
    link_to cliente.nome, admin_cliente_path(cliente)
  end

end