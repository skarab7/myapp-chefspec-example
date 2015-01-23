require_relative '../spec_helper.rb'

describe 'myapp-example::default' do
  
    it 'install_package' do
        chef_run = ChefSpec::SoloRunner.new
        chef_run.converge 'myapp-example::default' 

        expect(chef_run).to install_package("vim-nox")
    end

    it 'creates config_file' do
        #you could stub even search: stub_search(:users, 'groups:bla AND action:create').and_return([])
        chef_run = ChefSpec::SoloRunner.new
        chef_run.node.set['myapp_example']['config_content']="{'a' : 'b'}"
        chef_run.converge 'myapp-example::default' 

        expect(chef_run).to render_file(chef_run.node['myapp_example']['config_file'])

        expect(chef_run).to render_file(chef_run.node['myapp_example']['config_file']).with_content(
            "{'a' : 'b'}"
        )
    end
end
