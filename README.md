# Git Module

Puppet module designed to manage git as well as cloned git repos.

## Requirements

Currently only tested using Ubuntu Quantal.

## Setup

To install and bootstrap git, simply add the class defintion:

    class { 'git': }

To setup a new git repository:

    git::resource::repository { 'test.repo':
      repo   => 'https://github.com/carlalexander/puppet-git.git',
      target => 'git',
      cwd    => '/etc/puppet/modules'
    }