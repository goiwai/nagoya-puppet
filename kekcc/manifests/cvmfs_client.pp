# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include kekcc::cvmfs_client
class kekcc::cvmfs_client (

) {
  lookup(kekcc::cvmfs_client).each |String $resource_type, Hash $title_parameters| {
    notice("\$resource_type=${resource_type}  \$title_parameters=${title_parameters}")
    if $resource_type == 'file' {
      $title_parameters.each |String $title, Hash $parameter| {
        if has_key($parameter, 'epp') {
          $filtered_param = $parameter.filter |$k, $v| { $k != 'epp' }
          $p = $filtered_param + {'content' => epp($parameter['epp'][0], lookup($parameter['epp'][1]))}
          create_resources($resource_type, {$title => $p})
        } else {
          create_resources($resource_type, {$title => $parameter})
        }
      }
    } else {
      create_resources($resource_type, $title_parameters)
    }
  }
}
