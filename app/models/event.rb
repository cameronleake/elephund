class Event < ActiveRecord::Base
  attr_accessible :cost, :description, :event_date, :status
  validates_presence_of :cost, :description
  has_many :participations, :conditions => { :status => "OPEN" }    # Sets the status to OPEN by default on creating entry
  has_many :users, :through => :participations
  before_save :default_values
    
  def default_values
    self.status ||= 'OPEN'
  end
  
end
