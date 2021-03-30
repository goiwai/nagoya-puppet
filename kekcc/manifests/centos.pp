# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include kekcc::centos
class kekcc::centos (

) {
  notice(lookup(kekcc::centos))
  lookup(kekcc::centos).each |String $resource_type, Hash $title_parameters| {
    notice("${resource_type} ${title_parameters}")
    # notice("hash_len=${title_parameters.length()} ${title}")
    create_resources($resource_type, $title_parameters)
  }
}
