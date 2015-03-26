include_recipe './ruby-base.rb'

RBENV_SCRIPT = "/etc/profile.d/rbenv.sh"

[
  {
    name: "bundler"
  },
  {
    name: "rails",
    version: node["rails"] ? node["rails"]["version"] : nil
  }
].each do |gem_|
  execute "gem install #{gem_[:name]}" do
    command "source #{RBENV_SCRIPT}; gem install #{gem_[:name]} #{gem_[:version] ? "-v "+gem_[:version] : ""}; rbenv rehash"
    not_if "gem list | grep #{gem_[:name]}"
  end
end