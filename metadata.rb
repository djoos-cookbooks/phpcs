name 'phpcs'
maintainer 'David Joos'
maintainer_email 'development@davidjoos.com'
license 'MIT'
description 'Installs/Configures phpcs'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.4.0'

%w[debian ubuntu redhat centos fedora scientific amazon].each do |os|
  supports os
end

source_url 'https://github.com/djoos-cookbooks/phpcs' if respond_to?(:source_url)
issues_url 'https://github.com/djoos-cookbooks/phpcs/issues' if respond_to?(:issues_url)

depends 'php'
depends 'composer'
depends 'git'

recipe 'phpcs', 'Installs phpcs.'
recipe 'phpcs::composer', 'Installs phpcs using composer.'
recipe 'phpcs::pear', 'Installs phpcs using pear.'
recipe 'phpcs::coding_standard', 'Installs additional coding standard(s).'
