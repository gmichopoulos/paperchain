class LoadData < ActiveRecord::Migration
  def up
    # Create initial authors
    down
    ac = Author.new(:first_name => "Alex", :last_name => "Cope", :email => "alexcope@stanford.edu", :penname => "cope_alope")
    ac.save(:validate => false)
    gm = Author.new(:first_name => "George", :last_name => "Michopoulos", :email => "giorgos@stanford.edu", :penname => "greekboy", :password => "slut")
    gm.save(:validate => false)
    mo = Author.new(:first_name => "Mark", :last_name => "O'Meara", :email => "omeara13@stanford.edu", :penname => "mearcat")
    mo.save(:validate => false)
    sa = Author.new(:first_name => "Shilpa", :last_name => "Apte", :email => "sapte1@stanford.edu", :penname => "shilpalicious")
    sa.save(:validate => false)

    # Create initial chains
    chain1 = Chain.new(:start_date => "2013-05-30 10:44:23", :link_rate => "0101010", :num_links => "2", :title => "Once upon a house")
    chain1.authors << ac
    chain1.save(:validate => false)

    chain2 = Chain.new(:start_date => "2013-05-30 10:44:23", :link_rate => "0101010", :num_links => "2", :title => "History of France")
    chain2.authors << mo
    chain2.save(:validate => false)    

    chain3 = Chain.new(:start_date => "2013-05-31 10:44:23", :link_rate => "1001010", :num_links => "1", :title => "Haikus")
    chain3.authors << mo
    chain3.save(:validate => false) 

    # Create initial links
    link1 = Link.new(:date => "2013-05-31 8:44:23", :title => "Lorem 1", :link_text => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer malesuada fringilla urna, eget convallis metus fringilla non. Donec elementum, est eget porta interdum, arcu est consequat lectus, sed rutrum neque arcu at erat. Vivamus et urna sit amet odio tempus dictum. Sed facilisis arcu a sem volutpat vitae dapibus risus blandit. Nam semper bibendum ante, a aliquam massa fringilla vitae. Curabitur sed risus eros, in tempus massa. Pellentesque arcu enim, egestas vitae volutpat ut, semper eget nunc. Aliquam dignissim hendrerit ante, sed bibendum orci commodo ac. Nunc bibendum faucibus pellentesque. Mauris commodo cursus turpis. Praesent tincidunt, nibh ac vehicula sollicitudin, arcu neque euismod diam, quis lobortis lectus urna ut diam. Phasellus condimentum ornare sodales. Mauris tellus risus, mattis sit amet tristique at, dignissim a mauris. Proin tincidunt risus a velit pellentesque sed sodales lacus convallis.

Sed laoreet scelerisque sapien sit amet egestas. Maecenas interdum dapibus nunc, a lacinia est porta ut. Cras hendrerit sagittis metus non vehicula. In hac habitasse platea dictumst. Praesent at vestibulum diam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet nunc non enim molestie ut convallis nunc rhoncus. Proin ipsum sapien, pharetra ut sodales ac, fringilla sit amet elit. In nisi ligula, accumsan in euismod id, hendrerit ut metus. Quisque quis arcu et neque volutpat elementum. Vivamus fermentum mattis felis non dapibus. Quisque faucibus sapien odio.")
    link1.author = ac
    link1.chain = chain1
    link1.save(:validate => false)

    link2 = Link.new(:date => "2013-06-03 8:44:23", :title => "Lorem 2", :link_text => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer malesuada fringilla urna, eget convallis metus fringilla non. Donec elementum, est eget porta interdum, arcu est consequat lectus, sed rutrum neque arcu at erat. Vivamus et urna sit amet odio tempus dictum. Sed facilisis arcu a sem volutpat vitae dapibus risus blandit. Nam semper bibendum ante, a aliquam massa fringilla vitae. Curabitur sed risus eros, in tempus massa. Pellentesque arcu enim, egestas vitae volutpat ut, semper eget nunc. Aliquam dignissim hendrerit ante, sed bibendum orci commodo ac. Nunc bibendum faucibus pellentesque. Mauris commodo cursus turpis. Praesent tincidunt, nibh ac vehicula sollicitudin, arcu neque euismod diam, quis lobortis lectus urna ut diam. Phasellus condimentum ornare sodales. Mauris tellus risus, mattis sit amet tristique at, dignissim a mauris. Proin tincidunt risus a velit pellentesque sed sodales lacus convallis.

Sed laoreet scelerisque sapien sit amet egestas. Maecenas interdum dapibus nunc, a lacinia est porta ut. Cras hendrerit sagittis metus non vehicula. In hac habitasse platea dictumst. Praesent at vestibulum diam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet nunc non enim molestie ut convallis nunc rhoncus. Proin ipsum sapien, pharetra ut sodales ac, fringilla sit amet elit. In nisi ligula, accumsan in euismod id, hendrerit ut metus. Quisque quis arcu et neque volutpat elementum. Vivamus fermentum mattis felis non dapibus. Quisque faucibus sapien odio.")
    link2.author = ac
    link2.chain = chain1
    link2.save(:validate => false)

    link3 = Link.new(:date => "2013-05-31 8:44:23", :title => "Lorem 3", :link_text => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer malesuada fringilla urna, eget convallis metus fringilla non. Donec elementum, est eget porta interdum, arcu est consequat lectus, sed rutrum neque arcu at erat. Vivamus et urna sit amet odio tempus dictum. Sed facilisis arcu a sem volutpat vitae dapibus risus blandit. Nam semper bibendum ante, a aliquam massa fringilla vitae. Curabitur sed risus eros, in tempus massa. Pellentesque arcu enim, egestas vitae volutpat ut, semper eget nunc. Aliquam dignissim hendrerit ante, sed bibendum orci commodo ac. Nunc bibendum faucibus pellentesque. Mauris commodo cursus turpis. Praesent tincidunt, nibh ac vehicula sollicitudin, arcu neque euismod diam, quis lobortis lectus urna ut diam. Phasellus condimentum ornare sodales. Mauris tellus risus, mattis sit amet tristique at, dignissim a mauris. Proin tincidunt risus a velit pellentesque sed sodales lacus convallis.

Sed laoreet scelerisque sapien sit amet egestas. Maecenas interdum dapibus nunc, a lacinia est porta ut. Cras hendrerit sagittis metus non vehicula. In hac habitasse platea dictumst. Praesent at vestibulum diam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet nunc non enim molestie ut convallis nunc rhoncus. Proin ipsum sapien, pharetra ut sodales ac, fringilla sit amet elit. In nisi ligula, accumsan in euismod id, hendrerit ut metus. Quisque quis arcu et neque volutpat elementum. Vivamus fermentum mattis felis non dapibus. Quisque faucibus sapien odio.")
    link3.author = mo
    link3.chain = chain2
    link3.save(:validate => false)

    link4 = Link.new(:date => "2013-06-03 8:44:23", :title => "Lorem 4", :link_text => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer malesuada fringilla urna, eget convallis metus fringilla non. Donec elementum, est eget porta interdum, arcu est consequat lectus, sed rutrum neque arcu at erat. Vivamus et urna sit amet odio tempus dictum. Sed facilisis arcu a sem volutpat vitae dapibus risus blandit. Nam semper bibendum ante, a aliquam massa fringilla vitae. Curabitur sed risus eros, in tempus massa. Pellentesque arcu enim, egestas vitae volutpat ut, semper eget nunc. Aliquam dignissim hendrerit ante, sed bibendum orci commodo ac. Nunc bibendum faucibus pellentesque. Mauris commodo cursus turpis. Praesent tincidunt, nibh ac vehicula sollicitudin, arcu neque euismod diam, quis lobortis lectus urna ut diam. Phasellus condimentum ornare sodales. Mauris tellus risus, mattis sit amet tristique at, dignissim a mauris. Proin tincidunt risus a velit pellentesque sed sodales lacus convallis.

Sed laoreet scelerisque sapien sit amet egestas. Maecenas interdum dapibus nunc, a lacinia est porta ut. Cras hendrerit sagittis metus non vehicula. In hac habitasse platea dictumst. Praesent at vestibulum diam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet nunc non enim molestie ut convallis nunc rhoncus. Proin ipsum sapien, pharetra ut sodales ac, fringilla sit amet elit. In nisi ligula, accumsan in euismod id, hendrerit ut metus. Quisque quis arcu et neque volutpat elementum. Vivamus fermentum mattis felis non dapibus. Quisque faucibus sapien odio.")
    link4.author = mo
    link4.chain = chain2
    link4.save(:validate => false)

    link5 = Link.new(:date => "2013-05-31 8:44:23", :title => "Lorem 5", :link_text => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer malesuada fringilla urna, eget convallis metus fringilla non. Donec elementum, est eget porta interdum, arcu est consequat lectus, sed rutrum neque arcu at erat. Vivamus et urna sit amet odio tempus dictum. Sed facilisis arcu a sem volutpat vitae dapibus risus blandit. Nam semper bibendum ante, a aliquam massa fringilla vitae. Curabitur sed risus eros, in tempus massa. Pellentesque arcu enim, egestas vitae volutpat ut, semper eget nunc. Aliquam dignissim hendrerit ante, sed bibendum orci commodo ac. Nunc bibendum faucibus pellentesque. Mauris commodo cursus turpis. Praesent tincidunt, nibh ac vehicula sollicitudin, arcu neque euismod diam, quis lobortis lectus urna ut diam. Phasellus condimentum ornare sodales. Mauris tellus risus, mattis sit amet tristique at, dignissim a mauris. Proin tincidunt risus a velit pellentesque sed sodales lacus convallis.

Sed laoreet scelerisque sapien sit amet egestas. Maecenas interdum dapibus nunc, a lacinia est porta ut. Cras hendrerit sagittis metus non vehicula. In hac habitasse platea dictumst. Praesent at vestibulum diam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet nunc non enim molestie ut convallis nunc rhoncus. Proin ipsum sapien, pharetra ut sodales ac, fringilla sit amet elit. In nisi ligula, accumsan in euismod id, hendrerit ut metus. Quisque quis arcu et neque volutpat elementum. Vivamus fermentum mattis felis non dapibus. Quisque faucibus sapien odio.")
    link5.author = mo
    link5.chain = chain3
    link5.save(:validate => false)

  end

  def down
    Author.delete_all
    Chain.delete_all
    Link.delete_all
  end
end