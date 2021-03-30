$services = [
  'centos',
  'epel',
  'umd',
  'trustanchors',
  # 'local_ca',
  'hostcert',
  'voms_client',
  'lcmaps',
  'storm',
  'storm/common',
  'storm/storage',
  'storm/db',
  'storm/backend',
  'bdii',
  'storm/frontend', # backend first otherwise failed without mariadb/XML-RPC/Backend
  'storm/gridftp',
  'storm/webdav',
]

$services.each |String $svc| {
  include "kekcc::${regsubst($svc, '/', '::', 'G')}"
}
