class CreatePost < Mongoid::Migration
  def self.up

    tag = ['web' , 'rails']
  	#tag = []

    p = Post.new

    p.title         = 'GreenFish - Blog'
    p.image     	  = 'greenFish.jpg'
    p.category_id  	= Category.first._id
    p.tags          = tag
    p.is_active   	= true

    if(p.save)

      puts 'Post created'

    else

      puts 'Post could not be created' 
 
    end
  end

  def self.down
  end
end