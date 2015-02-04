# elasticsearch-docker-cookbook

Installs and configures OrientDb as a Docker container

## Supported Platforms

Platforms that support docker

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['elasticsearch']['docker_image']</tt></td>
    <td>String</td>
    <td>The docker image of elasticsearch that you want to use</td>
    <td><tt>dockerfile/elasticsearch</tt></td>
  </tr>
  <tr>
    <td><tt>['elasticsearch']['docker_image_tag']</tt></td>
    <td>String</td>
    <td>The specific tag of the docker image to use</td>
    <td><tt>latest</tt></td>
  </tr>
  <tr>
    <td><tt>['elasticsearch']['docker_container']</tt></td>
    <td>String</td>
    <td>The name used for the new docker container</td>
    <td><tt>elasticsearch</tt></td>
  </tr>
  <tr>
    <td><tt>['elasticsearch']['config_path']</tt></td>
    <td>String</td>
    <td>The path to use as docker volume for configuration files</td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>['elasticsearch']['data_path']</tt></td>
    <td>String</td>
    <td>The path to use as docker volume for elasticsearch indices/shard files</td>
    <td><tt>/var/data/elasticsearch</tt></td>
  </tr>
</table>



## Usage

### elasticsearch-docker::default

Include `elasticsearch-docker` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[elasticsearch-docker]"
  ]
}
```

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (i.e. `add-new-recipe`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request
