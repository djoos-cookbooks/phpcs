name             "phpcs"
maintainer       "Escape Studios"
maintainer_email "dev@escapestudios.com"
license          "MIT"
description      "Installs/Configures phpcs"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.6"

%w{ debian ubuntu redhat centos fedora scientific amazon }.each do |os|
supports os
end

depends "php"
depends "composer"
depends "git"

recipe "phpcs", "Installs phpcs."
recipe "phpcs::composer", "Installs phpcs using composer."
recipe "phpcs::pear", "Installs phpcs using pear."
recipe "phpcs::coding-standard", "Installs additional coding standard(s)."