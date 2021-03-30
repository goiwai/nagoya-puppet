# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include kekcc::storm::storage
class kekcc::storm::storage (

) {
  lookup(kekcc::storm::storage).each |String $resource_type, Hash $title_parameters| {
    notice("${resource_type} ${title_parameters}")
    create_resources($resource_type, $title_parameters)
  }
}
