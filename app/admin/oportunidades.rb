ActiveAdmin.register Oportunidade do
# actions: false
  #menu false
  scope :ativas
  scope :inativas

  permit_params :ativa

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

end
