# Class: git
#
# This module manages git.
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
# The module works with sensible defaults:
#
# node default {
#   include git
# }
class git {
  class { 'git::package': }
}