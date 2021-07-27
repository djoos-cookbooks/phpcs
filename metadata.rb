name 'phpcs'
maintainer 'David Joos'
maintainer_email 'development@davidjoos.com'
license 'MIT'
description 'Installs/Configures phpcs'
version '1.4.0'

%w(debian ubuntu redhat centos fedora scientific amazon).each do |os|
  supports os
end

source_url 'https://github.com/djoos-cookbooks/phpcs'
issues_url 'https://github.com/djoos-cookbooks/phpcs/issues'

depends 'php'
depends 'composer'
depends 'git'
