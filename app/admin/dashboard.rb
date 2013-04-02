ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do

    columns do
       column do
         panel "Recent Contact Tickets" do
           table_for Contact.last(5).reverse do
             column ("subject") {|contact| link_to(contact.subject, admin_contact_path(contact)) } 
             column :created_at
           end
           strong { link_to "View All Contact Tickets", admin_contacts_path }
         end
       end
     end
     
    columns do
      column do
        panel "Recent Users" do
          table_for User.last(5).reverse do
            column ("email") {|user| link_to(user.email, admin_user_path(user)) } 
            column :created_at
          end
          strong { link_to "View All Users", admin_users_path }
        end
      end
    end
    
    columns do
      column do
        panel "Recent Events" do
          table_for Event.last(5).reverse do
            column ("description") {|event| link_to(event.description, admin_event_path(event)) } 
            column :created_at
          end
          strong { link_to "View All Events", admin_events_path }
        end
      end
    end   
  end
end
