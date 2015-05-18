class CreateContact < Mongoid::Migration
  def self.up

    c = Contact.new

    c.name     = 'Greenfisher'
    c.email    = 'greenfish@foobar.com'
    c.subject  = 'Hello Greenfish'
    c.message  = 'This is a message'
    c.status   = false

    if(c.save)

      puts 'Contact created'

    else

      puts 'Contact could not be created' 
 
    end

  end

  def self.down
  end
end