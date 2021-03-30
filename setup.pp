# change these variables below if needbe
$files_prefix_dir = '/mnt/nagoya-puppet'
$links_and_targets = {
  '/etc/puppetlabs/code/modules/kekcc' => join([$files_prefix_dir, 'kekcc'], '/'),
  '/etc/puppetlabs/puppet/keys' => join([$files_prefix_dir, 'keys'], '/'),
}
$manifests = [
  'grid-ui.pp',
  'storm-all-in-one.pp',
]

$source_manifest_dir = join([$files_prefix_dir, 'manifests'], '/')
$dest_manifest_dir = '/etc/puppetlabs/code/environments/production/manifests'

# '/etc/puppetlabs/code/environments/production/manifests/node.pp' => join([$files_prefix_dir, 'node.pp'], '/'),
$module_metadata = join([$links_and_targets['/etc/puppetlabs/code/modules/kekcc'], 'metadata.json'], '/')

if find_file($files_prefix_dir) {
  $links_and_targets.each |String $link, String $target| {
    if find_file($target) {
      file { $link:
        ensure => link,
        target => $target,
      }
    } else {
      fail("Not found: \$target=${target}")
    }
  }
  $manifests.each |String $manifest| {
    $source_file = join([$source_manifest_dir, $manifest], '/')
    $dest_file = join([$dest_manifest_dir, $manifest], '/')
    if find_file($source_file) {
      file { $dest_file:
        ensure => file,
        source => "file://${source_file}",
      }
    } else {
      fail("Not found: \$source_file=${source_file}")
    }
  }
} else {
  fail("Not found: \$files_prefix_dir=${files_prefix_dir}")
}

# load_module_metadata() is a function of puppetlabs/stdlib
$kekcc_metadata = json_data({path => $module_metadata}, Puppet::LookupContext(data_hash))

$kekcc_metadata['dependencies'].each |Hash $moddep| {
  $mod = regsubst($moddep['name'], '/', '-', 'G')
  # notice($mod)
  $cmds = [
    "puppet module install ${mod}",
    "puppet module upgrade ${mod}",
  ]
  exec { $cmds:
    path      => [
      '/opt/puppetlabs/bin',
      '/usr/bin',
      '/usr/sbin',
      '/bin',
    ],
    provider  => shell,
    logoutput => true,
  }
}
