class CreateCategory < Mongoid::Migration
  def self.up

    c = Category.new

    c.name  = 'Fish'

    c.order = 1

    c.status = true

    if(c.save)

      puts 'Category created'

    else

      puts 'Category could not be created' 
 
    end

  end

  def self.down
  end
end