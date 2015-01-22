# myapp-example-cookbook

Example of a cookbook  with chefspec (in memory testing cookbook)

More examples:

 - https://docs.chef.io/chefspec.html
 - https://github.com/sethvargo/chefspec/tree/master/examples

## How to run chefspec:

- first time and every time you change the cookbook dependences (slow):

      make run_cookbook_rspec

- every time (we skip running berks, so it is extremely fast):

      make run_cookbook_fast_rspec

## Supported Platforms

TODO: List your supported platforms.

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['myapp-example']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### myapp-example::default

Include `myapp-example` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[myapp-example::default]"
  ]
}
```

## License and Authors

Author:: YOUR_NAME (<YOUR_EMAIL>)
