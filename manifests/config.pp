# Class: git::config
#
# This module manages git bootstrap and configuration
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
class git::config(
  $user_name         = undef,
  $user_email        = undef,
  $credential_helper = undef,
) {
  if $user_name {
    exec { 'set-user-name':
      command => "git config --global user.name \"${user_name}\""
    }
  }

  if $user_email {
    exec { 'set-user-email':
      command => "git config --global user.email \"${user_email}\""
    }
  }

  if $credential_helper {
    exec { 'set-user-email':
      command => "git config --global credential.helper '${credential_helper}'"
    }
  }
}