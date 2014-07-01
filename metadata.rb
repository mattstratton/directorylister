name             'directorylister'
maintainer       'True Blue'
maintainer_email 'jbruso@trueblue.com'
license          'We need no stinking license.'
description      'Installs/Configures directorylister'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))

version          '0.1.55'

depends "windows", "~> 1.31.0"
depends "iis" , "~> 2.1.2"
depends "minitest-handler", "= 1.1.2"
depends "chef_handler", "~> 1.1.6"
