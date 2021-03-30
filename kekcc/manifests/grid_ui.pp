# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include kekcc::grid_ui
class kekcc::grid_ui (

) {
  lookup(kekcc::grid_ui).each |String $resource_type, Hash $title_parameters| {
    notice("\$resource_type=${resource_type}  \$title_parameters=${title_parameters}")
    create_resources($resource_type, $title_parameters)
  }
}
