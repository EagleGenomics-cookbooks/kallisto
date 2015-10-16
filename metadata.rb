name 'kallisto'
maintainer 'Eagle Genomics'
maintainer_email 'chef@eaglegenomics.com'
license 'apache2'
description 'Installs/Configures kallisto'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.0.0'

supports 'centos', '= 6.6'

depends 'build-essential'
depends 'magic_shell'
