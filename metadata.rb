# coding: UTF-8

maintainer 'Cerner Corp'
maintainer_email 'Bryan.Baugher@Cerner.com'
license 'All rights reserved'
description 'Installs/Configures tomcat'
long_description 'This cookbook is meant to install and configure an instance of tomcat'

name 'cerner_tomcat'

supports 'centos'
supports 'ubuntu'

depends 'java'
depends 'ulimit'
depends 'logrotate'

version '2.2.0'
