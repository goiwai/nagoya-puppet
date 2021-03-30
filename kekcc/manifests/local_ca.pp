# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include kekcc::local_ca
class kekcc::local_ca (

) {
  lookup(kekcc::local_ca).each |String $resource_type, Hash $title_parameters| {
    create_resources($resource_type, $title_parameters)
  }
}
