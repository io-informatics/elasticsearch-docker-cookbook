docker_service 'default' do
  action [:create, :start]
end

# Pull docker image
docker_image node[:elasticsearch][:docker_image] do
	tag node[:elasticsearch][:docker_image_tag]
	action :pull
end

# Cread volumens directory
volumens = Array.new
config_provided = false

if (node[:elasticsearch][:config_path]) then
	directory node[:elasticsearch][:config_path] do
		recursive true
		action :create
	end
	volumens.push(node[:elasticsearch][:config_path]+":/config")
	config_provided = true
end

if(node[:elasticsearch][:data_path])
	directory node[:elasticsearch][:data_path] do
		recursive true
		action :create
	end
	volumens.push(node[:elasticsearch][:data_path]+":/data")
end

# Build the configuration

# Run the docker container
docker_container "elasticsearch" do
	image node[:elasticsearch][:docker_image]
	tag node[:elasticsearch][:docker_image_tag]
	container_name node[:elasticsearch][:docker_container]
	detach true
	port ['9200:9200', '9300:9300']
	binds volumens
	entrypoint "/elasticsearch/bin/elasticsearch -Des.config=/config/elasticsearch.yml" if config_provided
end

service "elasticsearch" do
	action :nothing
end
