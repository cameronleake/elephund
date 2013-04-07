ActiveAdmin.register User do
   menu :priority => 3
  
  filter :first_name
  filter :last_name
  filter :email
  filter :created_at
  
  config.sort_order = "created_at_desc"
  config.per_page = 15
  
  index do
    selectable_column
    column :last_name
    column :first_name
    column :email
    column :email_verified
    column :password_reset_sent_at
    column :created_at
    default_actions
  end
  
  form do |f|                         
    f.inputs "New User" do       
      f.input :first_name              
      f.input :last_name             
      f.input :email
      f.input :password  
    end                               
    f.actions                         
  end
  
end
