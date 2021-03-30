# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include kekcc::hostcert
class kekcc::hostcert (

) {
  lookup(kekcc::hostcert).each |String $resource_type, Hash $title_parameters| {
    create_resources($resource_type, $title_parameters)
  }
}
