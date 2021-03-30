# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include kekcc::bdii
class kekcc::bdii (

) {
  notice(lookup(kekcc::bdii))
  lookup(kekcc::bdii).each |String $resource_type, Hash $title_parameters| {
    notice("${resource_type} ${title_parameters}")
    create_resources($resource_type, $title_parameters)
  }
}
