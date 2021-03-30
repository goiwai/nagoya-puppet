# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include kekcc::voms_client
class kekcc::voms_client (

) {
  notice(lookup(kekcc::voms_client))
  lookup(kekcc::voms_client).each |String $resource_type, Hash $title_parameters| {
    notice("${resource_type} ${title_parameters}")
    create_resources($resource_type, $title_parameters)
  }
}
