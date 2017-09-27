# RPM-Packages

Sample repository for your package recipes, to be used with [Revolution](https://github.com/grindrlabs/revolution)

Fork me (privately, if you want) into your org, populate me, use me!

## Workflow

### Requirements

- Clone down both the [tool](https://github.com/grindrlabs/revolution) and the [recipes](https://github.com/grindrlabs/rpm-packages)
- Perform work, following the Package Assembly guidelines [below](#package-assembly)
- To build a package you just put together, follow the Package Building guidelines [below](#package-building)

### Package Assembly

Recipe specifications are available [here](https://github.com/bernd/fpm-cookery/wiki/Recipe-Specification). You should also take a look at the [examples](examples/).

#### Dependencies

Ensure that all of your packages have the base package as dependency in your recipe.rb or common.yml in manifest section, e.g.:

```ruby
depends 'openssl', 'base'
```

### Package Building

#### 0. Spin up a vagrant box

- `$ vagrant up` should suffice

#### 1. In Vagrant, generate the .rpm package:

1. `$ cd recipes/${package}/` - change directory to your recipe
2. `$ bundle exec 'fpm-cook clean' && bundle exec 'fpm-cook --no-deps'` - actually build the package

#### 2. Test the .rpm package:

We plan on opensourcing our testing facility. In the meantime, you can use the vagrant box as the tester for your packages.

#### 3. Once the PR is merged, travis will automatically build your package and upload it to s3.

## Status

Pre-alpha. Revolution is not functional yet, which is why we're using Makefiles and bash scripts here.

## License

Licensed under either of
* Apache License, Version 2.0 ([LICENSE-APACHE](LICENSE-APACHE) or http://www.apache.org/licenses/LICENSE-2.0)
* MIT license ([LICENSE-MIT](LICENSE-MIT) or http://opensource.org/licenses/MIT)
  at your option.

### Contribution

Unless you explicitly state otherwise, any contribution intentionally submitted for inclusion in the work by you, as defined in the Apache-2.0 license, shall be dual licensed as above, without any additional terms or conditions.
