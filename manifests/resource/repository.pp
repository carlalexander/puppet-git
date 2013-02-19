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
  $target = $name,
  $cwd = undef
) {
  Exec {
    path => '/bin:/sbin:/usr/bin:/usr/sbin',
  }
  File {
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  if (!$repo) {
    fail('You must specify a repo')
  }

  if (!$cwd) {
    fail('You must specify a working directory')
  }

  exec { "git-clone-${name}":
    command => "git clone ${repo} ${target}",
    cwd     => $cwd,
    creates => "${cwd}/${target}/.git",
    require => Class['git']
  }
}