$services = [
  'centos',
  'epel',
  'umd',
  'trustanchors',
  # 'local_ca',
  'voms_client',
  'grid_ui',
  'cvmfs_client',
]

$services.each |String $svc| {
  include "kekcc::${regsubst($svc, '/', '::', 'G')}"
}
