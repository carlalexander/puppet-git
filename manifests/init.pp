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
class git (
  $user_name         = undef,
  $user_email        = undef,
  $credential_helper = undef,
) {
  class { 'git::package': }

  class { 'git::config':
    user_name         => $user_name,
    user_email        => $user_email,
    credential_helper => $credential_helper,
  }
}