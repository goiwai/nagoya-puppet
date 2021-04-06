# change these variables below if needbe
$files_prefix_dir = '/mnt/nagoya-puppet'

package { 'puppet-agent':
  ensure => installed,
}

file { '/etc/puppetlabs/code/modules/kekcc':
  ensure  => link,
  target  => join([$files_prefix_dir, 'kekcc'], '/'),
  require => Package['puppet-agent'],
}

file { '/etc/puppetlabs/puppet/keys':
  ensure  => link,
  target  => join([$files_prefix_dir, 'keys'], '/'),
  require => Package['puppet-agent'],
}

file { '/etc/puppetlabs/code/environments/production/manifests/grid-ui.pp':
  ensure  => file,
  source  => join(['file://', join([$files_prefix_dir, 'manifests', 'grid-ui.pp'], '/')]),
  require => Package['puppet-agent'],
}

file { '/etc/puppetlabs/code/environments/production/manifests/storm-all-in-one.pp':
  ensure  => file,
  source  => join(['file://', join([$files_prefix_dir, 'manifests', 'storm-all-in-one.pp'], '/')]),
  require => Package['puppet-agent'],
}

# load_module_metadata() is a function of puppetlabs/stdlib
$kekcc_metadata = json_data({path => join([$files_prefix_dir, 'kekcc', 'metadata.json'], '/')}, Puppet::LookupContext(data_hash))

$kekcc_metadata['dependencies'].each |Hash $moddep| {
  $mod = regsubst($moddep['name'], '/', '-', 'G')
  # notice($mod)
  exec { "puppet module install ${mod}":
    path      => [
      '/opt/puppetlabs/bin',
      '/usr/bin',
      '/usr/sbin',
      '/bin',
    ],
    provider  => shell,
    logoutput => true,
    require   => [
      File['/etc/puppetlabs/code/modules/kekcc'],
      File['/etc/puppetlabs/puppet/keys'],
      File['/etc/puppetlabs/code/environments/production/manifests/grid-ui.pp'],
      File['/etc/puppetlabs/code/environments/production/manifests/storm-all-in-one.pp'],
    ],
  }
}

$kekcc_metadata['dependencies'].each |Hash $moddep| {
  $mod = regsubst($moddep['name'], '/', '-', 'G')
  exec { "puppet module upgrade ${mod}":
    path      => [
      '/opt/puppetlabs/bin',
      '/usr/bin',
      '/usr/sbin',
      '/bin',
    ],
    provider  => shell,
    logoutput => true,
    unless    => [
      "test ${mod} = \"puppetlabs-stdlib\"",
    ],
    require   => [
      Exec["puppet module install ${mod}"],
    ],
  }
}
