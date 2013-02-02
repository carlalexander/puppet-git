# Class: git::package
#
# This module manages the git package installation
#
# Parameters:
#
# There are no default parameters for this class.
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# This class file is not called directly
class git::package {
  package { 'git-core':
    ensure => latest,
  }
}