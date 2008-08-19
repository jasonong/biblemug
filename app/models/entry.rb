class Entry < ActiveRecord::Base

  define_index do 
    indexes title, :sortable => true
    indexes body
  end

  validates_presence_of :title

  def initialize(*)
    super
    #self.title = 'Fill in your title here'
  end

end
