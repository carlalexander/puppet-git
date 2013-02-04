# Define: git::resource::repository
#
# This defines a git repository
#
# Parameters:
#   [*repo*]   - Repo path
#   [*target*] - Target
#   [*cwd*]    - Working directory
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
#  git::resource::repository { 'test.repo':
#    repo   => 'https://github.com/carlalexander/puppet-git.git',
#    target => 'git',
#    cwd    => '/etc/puppet/modules'
#  }
define git::resource::repository (
  $repo = undef,
  $target = undef,
  $cwd = undef
) {
  if !$repo {
    fail('You must specify a repo')
  }

  if !$target {
    fail('You must specify a target')
  }

  if !$cwd {
    fail('You must specify a working directory')
  }

  exec { 'git-clone':
    command => "/usr/bin/git clone ${repo} ${target}",
    cwd     => $cwd,
    creates => "${cwd}/${target}",
    notify  => File["${cwd}/${target}"]
  }

  file { "${cwd}/${target}":
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }
}