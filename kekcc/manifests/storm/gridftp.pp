# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include kekcc::storm::gridftp
class kekcc::storm::gridftp (

) {
  lookup(kekcc::storm::gridftp).each |String $resource_type, Hash $title_parameters| {
    create_resources($resource_type, $title_parameters)
  }
}
