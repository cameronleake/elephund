ActiveAdmin.register Event do
  menu :priority => 2
       
  filter :status
  filter :description
  filter :cost, :as => :numeric
  filter :event_date
  filter :created_at   
  
  config.sort_order = "created_at_desc"
  config.per_page = 15

  index do
    selectable_column
    column :event_date
    column :description
    column :cost, :sortable => :cost do |event|
      div :class => "event_cost" do
        number_to_currency event.cost
      end
    end
    column :status, :sortable => :status do |event|
      div :class => "event_status" do 
        event.status
      end
    end
    column :created_at
    default_actions
  end
  
  form do |f|                         
    f.inputs "New Event" do       
      f.input :event_date              
      f.input :description             
      f.input :cost
      f.input :status  
    end                               
    f.actions                         
  end

end
