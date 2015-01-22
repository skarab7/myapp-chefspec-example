# myapp-example-cookbook

Example of a cookbook  with chefspec (in memory testing cookbook)

More examples:

 - https://docs.chef.io/chefspec.html
 - https://github.com/sethvargo/chefspec/tree/master/examples

## How to run chefspec:

- run berks before running chefspec (notice: it is slow):

      make run_cookbook_chefspec

- does not run berks, so it is extremely fast, notice: after changing cookbook dependencies, you need to run: **berks vendor**:

      make run_cookbook_fast_chefspec


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
