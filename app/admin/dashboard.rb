ActiveAdmin.register_page "Dashboard" do

    # menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }
    menu false

    content title: proc{ I18n.t("active_admin.dashboard") } do
        # div class: "blank_slate_container", id: "dashboard_default_message" do
        #     span class: "blank_slate" do
        #         span I18n.t("active_admin.dashboard_welcome.welcome")
        #         small I18n.t("active_admin.dashboard_welcome.call_to_action")
        #     end
        # end
        
        columns do
            column do
                panel "Tarefas Vencidas" do
                    if tarefas_vencidas?
                        table_for tarefas_vencidas.limit(5) do
                            column :titulo
                            column :vencimento
                        end
                    else
                        text_node "Não há tarefas vencidas"
                    end
                end
            end

            column do
                panel "Tarefas adicionadas recentemente" do
                    table_for tarefas_recentes do 
                        column "Vencimento", :vencimento  
                        column "Tarefa", :titulo
                        column "Cliente" do |tarefa|
                            if tarefa.cliente
                                tarefa.cliente.nome
                            else
                                "Nenhum"
                            end
                        end
                        column "Ação" do |tarefa|
                            # link_to("Editar", edit_admin_cliente_tarefa_path(tarefa.id))
                            # link_to("Editar", edit_admin_cliente_tarefa_path(tarefa.cliente_id, tarefa.id))
                            link_to("Editar", edit_admin_tarefa_path(tarefa.id))
                        end
                    end  
                    # strong { link_to "Ver todas as Tarefas", admin_cliente_tarefas_path }  
                end
            end
        end
        # end
    end



# end
    

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  # end # content

    # ActiveAdmin::Dashboards.build do 
    #     section "Tarefas Recentes" do  
    #         table_for Tarefa.order("vencimento").limit(5) do  
    #             column :titulo  
    #             column :vencimento  
    #         end  
    #         # strong { link_to "Ver todas as Tarefas", admin_cliente_tarefas_path }  
    #     end
    # end
end


