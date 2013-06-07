class LoadData < ActiveRecord::Migration
  def up
    # Create initial authors
    down
    ac = Author.new(:first_name => "Alex", :last_name => "Cope", :email => "alexcope@stanford.edu", :penname => "copealope", :password => "bestBM4eva")
    ac.save(:validate => false)
    gm = Author.new(:first_name => "George", :last_name => "Michopoulos", :email => "giorgos@stanford.edu", :penname => "greekboy", :password => "slut")
    gm.save(:validate => false)
    mo = Author.new(:first_name => "Mark", :last_name => "O'Meara", :email => "omeara13@stanford.edu", :penname => "mearcat", :password => "starbuck")
    mo.save(:validate => false)
    sa = Author.new(:first_name => "Shilpa", :last_name => "Apte", :email => "sapte1@stanford.edu", :penname => "shilpalicious", :password => "thetalicious")
    sa.save(:validate => false)

    # Create initial chains
    chain1 = Chain.new(:start_date => "2013-05-30 10:44:23", :link_rate => "0101010", :title => "Once upon a house", :end_type => "entries", :num_left =>"4")
    chain1.authors << ac
    chain1.authors << sa
    chain1.save

    chain2 = Chain.new(:start_date => "2013-05-30 10:44:23", :link_rate => "0101010", :title => "History of France", :end_type => "entries", :num_left =>"3")
    chain2.authors << mo
    chain2.save   

    chain3 = Chain.new(:start_date => "2013-05-31 10:44:23", :link_rate => "1001010", :title => "Haikus", :end_type => "weeks", :num_left =>"5")
    chain3.authors << mo
    chain3.save

    # Create initial links
    link1 = Link.new(:date => "2013-05-31 8:44:23", :title => "Lorem 1", :link_text => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer malesuada fringilla urna, eget convallis metus fringilla non. Donec elementum, est eget porta interdum, arcu est consequat lectus, sed rutrum neque arcu at erat. Vivamus et urna sit amet odio tempus dictum. Sed facilisis arcu a sem volutpat vitae dapibus risus blandit. Nam semper bibendum ante, a aliquam massa fringilla vitae. Curabitur sed risus eros, in tempus massa. Pellentesque arcu enim, egestas vitae volutpat ut, semper eget nunc. Aliquam dignissim hendrerit ante, sed bibendum orci commodo ac. Nunc bibendum faucibus pellentesque. Mauris commodo cursus turpis. Praesent tincidunt, nibh ac vehicula sollicitudin, arcu neque euismod diam, quis lobortis lectus urna ut diam. Phasellus condimentum ornare sodales. Mauris tellus risus, mattis sit amet tristique at, dignissim a mauris. Proin tincidunt risus a velit pellentesque sed sodales lacus convallis.

Sed laoreet scelerisque sapien sit amet egestas. Maecenas interdum dapibus nunc, a lacinia est porta ut. Cras hendrerit sagittis metus non vehicula. In hac habitasse platea dictumst. Praesent at vestibulum diam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet nunc non enim molestie ut convallis nunc rhoncus. Proin ipsum sapien, pharetra ut sodales ac, fringilla sit amet elit. In nisi ligula, accumsan in euismod id, hendrerit ut metus. Quisque quis arcu et neque volutpat elementum. Vivamus fermentum mattis felis non dapibus. Quisque faucibus sapien odio.")
    link1.author = ac
    link1.chain = chain1
    link1.save

    link2 = Link.new(:date => "2013-06-03 8:44:23", :title => "Lorem 2", :link_text => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer malesuada fringilla urna, eget convallis metus fringilla non. Donec elementum, est eget porta interdum, arcu est consequat lectus, sed rutrum neque arcu at erat. Vivamus et urna sit amet odio tempus dictum. Sed facilisis arcu a sem volutpat vitae dapibus risus blandit. Nam semper bibendum ante, a aliquam massa fringilla vitae. Curabitur sed risus eros, in tempus massa. Pellentesque arcu enim, egestas vitae volutpat ut, semper eget nunc. Aliquam dignissim hendrerit ante, sed bibendum orci commodo ac. Nunc bibendum faucibus pellentesque. Mauris commodo cursus turpis. Praesent tincidunt, nibh ac vehicula sollicitudin, arcu neque euismod diam, quis lobortis lectus urna ut diam. Phasellus condimentum ornare sodales. Mauris tellus risus, mattis sit amet tristique at, dignissim a mauris. Proin tincidunt risus a velit pellentesque sed sodales lacus convallis.

Sed laoreet scelerisque sapien sit amet egestas. Maecenas interdum dapibus nunc, a lacinia est porta ut. Cras hendrerit sagittis metus non vehicula. In hac habitasse platea dictumst. Praesent at vestibulum diam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet nunc non enim molestie ut convallis nunc rhoncus. Proin ipsum sapien, pharetra ut sodales ac, fringilla sit amet elit. In nisi ligula, accumsan in euismod id, hendrerit ut metus. Quisque quis arcu et neque volutpat elementum. Vivamus fermentum mattis felis non dapibus. Quisque faucibus sapien odio.")
    link2.author = ac
    link2.chain = chain1
    link2.save

    link3 = Link.new(:date => "2013-05-31 8:44:23", :title => "Lorem 3", :link_text => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer malesuada fringilla urna, eget convallis metus fringilla non. Donec elementum, est eget porta interdum, arcu est consequat lectus, sed rutrum neque arcu at erat. Vivamus et urna sit amet odio tempus dictum. Sed facilisis arcu a sem volutpat vitae dapibus risus blandit. Nam semper bibendum ante, a aliquam massa fringilla vitae. Curabitur sed risus eros, in tempus massa. Pellentesque arcu enim, egestas vitae volutpat ut, semper eget nunc. Aliquam dignissim hendrerit ante, sed bibendum orci commodo ac. Nunc bibendum faucibus pellentesque. Mauris commodo cursus turpis. Praesent tincidunt, nibh ac vehicula sollicitudin, arcu neque euismod diam, quis lobortis lectus urna ut diam. Phasellus condimentum ornare sodales. Mauris tellus risus, mattis sit amet tristique at, dignissim a mauris. Proin tincidunt risus a velit pellentesque sed sodales lacus convallis.

Sed laoreet scelerisque sapien sit amet egestas. Maecenas interdum dapibus nunc, a lacinia est porta ut. Cras hendrerit sagittis metus non vehicula. In hac habitasse platea dictumst. Praesent at vestibulum diam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet nunc non enim molestie ut convallis nunc rhoncus. Proin ipsum sapien, pharetra ut sodales ac, fringilla sit amet elit. In nisi ligula, accumsan in euismod id, hendrerit ut metus. Quisque quis arcu et neque volutpat elementum. Vivamus fermentum mattis felis non dapibus. Quisque faucibus sapien odio.")
    link3.author = mo
    link3.chain = chain2
    link3.save

    link4 = Link.new(:date => "2013-06-03 8:44:23", :title => "Lorem 4", :link_text => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer malesuada fringilla urna, eget convallis metus fringilla non. Donec elementum, est eget porta interdum, arcu est consequat lectus, sed rutrum neque arcu at erat. Vivamus et urna sit amet odio tempus dictum. Sed facilisis arcu a sem volutpat vitae dapibus risus blandit. Nam semper bibendum ante, a aliquam massa fringilla vitae. Curabitur sed risus eros, in tempus massa. Pellentesque arcu enim, egestas vitae volutpat ut, semper eget nunc. Aliquam dignissim hendrerit ante, sed bibendum orci commodo ac. Nunc bibendum faucibus pellentesque. Mauris commodo cursus turpis. Praesent tincidunt, nibh ac vehicula sollicitudin, arcu neque euismod diam, quis lobortis lectus urna ut diam. Phasellus condimentum ornare sodales. Mauris tellus risus, mattis sit amet tristique at, dignissim a mauris. Proin tincidunt risus a velit pellentesque sed sodales lacus convallis.

Sed laoreet scelerisque sapien sit amet egestas. Maecenas interdum dapibus nunc, a lacinia est porta ut. Cras hendrerit sagittis metus non vehicula. In hac habitasse platea dictumst. Praesent at vestibulum diam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet nunc non enim molestie ut convallis nunc rhoncus. Proin ipsum sapien, pharetra ut sodales ac, fringilla sit amet elit. In nisi ligula, accumsan in euismod id, hendrerit ut metus. Quisque quis arcu et neque volutpat elementum. Vivamus fermentum mattis felis non dapibus. Quisque faucibus sapien odio.")
    link4.author = mo
    link4.chain = chain2
    link4.save

    link5 = Link.new(:date => "2013-05-31 8:44:23", :title => "Lorem 5", :link_text => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer malesuada fringilla urna, eget convallis metus fringilla non. Donec elementum, est eget porta interdum, arcu est consequat lectus, sed rutrum neque arcu at erat. Vivamus et urna sit amet odio tempus dictum. Sed facilisis arcu a sem volutpat vitae dapibus risus blandit. Nam semper bibendum ante, a aliquam massa fringilla vitae. Curabitur sed risus eros, in tempus massa. Pellentesque arcu enim, egestas vitae volutpat ut, semper eget nunc. Aliquam dignissim hendrerit ante, sed bibendum orci commodo ac. Nunc bibendum faucibus pellentesque. Mauris commodo cursus turpis. Praesent tincidunt, nibh ac vehicula sollicitudin, arcu neque euismod diam, quis lobortis lectus urna ut diam. Phasellus condimentum ornare sodales. Mauris tellus risus, mattis sit amet tristique at, dignissim a mauris. Proin tincidunt risus a velit pellentesque sed sodales lacus convallis.

Sed laoreet scelerisque sapien sit amet egestas. Maecenas interdum dapibus nunc, a lacinia est porta ut. Cras hendrerit sagittis metus non vehicula. In hac habitasse platea dictumst. Praesent at vestibulum diam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet nunc non enim molestie ut convallis nunc rhoncus. Proin ipsum sapien, pharetra ut sodales ac, fringilla sit amet elit. In nisi ligula, accumsan in euismod id, hendrerit ut metus. Quisque quis arcu et neque volutpat elementum. Vivamus fermentum mattis felis non dapibus. Quisque faucibus sapien odio.")
    link5.author = mo
    link5.chain = chain3
    link5.save

        link6 = Link.new(:date => "2013-5-31 8:44:23", :title => "Shilpa's Day", :link_text => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer malesuada fringilla urna, eget convallis metus fringilla non. Donec elementum, est eget porta interdum, arcu est consequat lectus, sed rutrum neque arcu at erat. Vivamus et urna sit amet odio tempus dictum. Sed facilisis arcu a sem volutpat vitae dapibus risus blandit. Nam semper bibendum ante, a aliquam massa fringilla vitae. Curabitur sed risus eros, in tempus massa. Pellentesque arcu enim, egestas vitae volutpat ut, semper eget nunc. Aliquam dignissim hendrerit ante, sed bibendum orci commodo ac. Nunc bibendum faucibus pellentesque. Mauris commodo cursus turpis. Praesent tincidunt, nibh ac vehicula sollicitudin, arcu neque euismod diam, quis lobortis lectus urna ut diam. Phasellus condimentum ornare sodales. Mauris tellus risus, mattis sit amet tristique at, dignissim a mauris. Proin tincidunt risus a velit pellentesque sed sodales lacus convallis.

Sed laoreet scelerisque sapien sit amet egestas. Maecenas interdum dapibus nunc, a lacinia est porta ut. Cras hendrerit sagittis metus non vehicula. In hac habitasse platea dictumst. Praesent at vestibulum diam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet nunc non enim molestie ut convallis nunc rhoncus. Proin ipsum sapien, pharetra ut sodales ac, fringilla sit amet elit. In nisi ligula, accumsan in euismod id, hendrerit ut metus. Quisque quis arcu et neque volutpat elementum. Vivamus fermentum mattis felis non dapibus. Quisque faucibus sapien odio.")
    link6.author = sa
    link6.chain = chain1
    link6.save(:validate => false)

    link7 = Link.new(:date => "2013-06-03 8:44:23", :title => "Hooray", :link_text => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer malesuada fringilla urna, eget convallis metus fringilla non. Donec elementum, est eget porta interdum, arcu est consequat lectus, sed rutrum neque arcu at erat. Vivamus et urna sit amet odio tempus dictum. Sed facilisis arcu a sem volutpat vitae dapibus risus blandit. Nam semper bibendum ante, a aliquam massa fringilla vitae. Curabitur sed risus eros, in tempus massa. Pellentesque arcu enim, egestas vitae volutpat ut, semper eget nunc. Aliquam dignissim hendrerit ante, sed bibendum orci commodo ac. Nunc bibendum faucibus pellentesque. Mauris commodo cursus turpis. Praesent tincidunt, nibh ac vehicula sollicitudin, arcu neque euismod diam, quis lobortis lectus urna ut diam. Phasellus condimentum ornare sodales. Mauris tellus risus, mattis sit amet tristique at, dignissim a mauris. Proin tincidunt risus a velit pellentesque sed sodales lacus convallis.

Sed laoreet scelerisque sapien sit amet egestas. Maecenas interdum dapibus nunc, a lacinia est porta ut. Cras hendrerit sagittis metus non vehicula. In hac habitasse platea dictumst. Praesent at vestibulum diam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet nunc non enim molestie ut convallis nunc rhoncus. Proin ipsum sapien, pharetra ut sodales ac, fringilla sit amet elit. In nisi ligula, accumsan in euismod id, hendrerit ut metus. Quisque quis arcu et neque volutpat elementum. Vivamus fermentum mattis felis non dapibus. Quisque faucibus sapien odio.")
    link7.author = sa
    link7.chain = chain1
    link7.save(:validate => false)

    link8 = Link.new(:date => "2013-06-07 8:44:23", :title => "A Story", :link_text => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer malesuada fringilla urna, eget convallis metus fringilla non. Donec elementum, est eget porta interdum, arcu est consequat lectus, sed rutrum neque arcu at erat. Vivamus et urna sit amet odio tempus dictum. Sed facilisis arcu a sem volutpat vitae dapibus risus blandit. Nam semper bibendum ante, a aliquam massa fringilla vitae. Curabitur sed risus eros, in tempus massa. Pellentesque arcu enim, egestas vitae volutpat ut, semper eget nunc. Aliquam dignissim hendrerit ante, sed bibendum orci commodo ac. Nunc bibendum faucibus pellentesque. Mauris commodo cursus turpis. Praesent tincidunt, nibh ac vehicula sollicitudin, arcu neque euismod diam, quis lobortis lectus urna ut diam. Phasellus condimentum ornare sodales. Mauris tellus risus, mattis sit amet tristique at, dignissim a mauris. Proin tincidunt risus a velit pellentesque sed sodales lacus convallis.

Sed laoreet scelerisque sapien sit amet egestas. Maecenas interdum dapibus nunc, a lacinia est porta ut. Cras hendrerit sagittis metus non vehicula. In hac habitasse platea dictumst. Praesent at vestibulum diam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet nunc non enim molestie ut convallis nunc rhoncus. Proin ipsum sapien, pharetra ut sodales ac, fringilla sit amet elit. In nisi ligula, accumsan in euismod id, hendrerit ut metus. Quisque quis arcu et neque volutpat elementum. Vivamus fermentum mattis felis non dapibus. Quisque faucibus sapien odio.")
    link8.author = ac
    link8.chain = chain1
    link8.save(:validate => false)



  end

  def down
    Author.delete_all
    Chain.delete_all
    Link.delete_all
  end
end
