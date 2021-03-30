# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include kekcc::storm::common
class kekcc::storm::common (

) {
  lookup(kekcc::storm::common).each |String $resource_type, Hash $title_parameters| {
    notice("${resource_type} ${title_parameters}")
    create_resources($resource_type, $title_parameters)
  }
  # working better, but not using create_resources
  Yumrepo <| tag == 'storm-stable-centos7' |> {
    ensure   => present,
    enabled  => 1,
    priority => 1,
    protect  => 1,
    require  => [
      Package[yum-plugin-priorities],
    ],
  }

  # working but...
  # class repo inherits storm::repo {
  #   Yumrepo['storm-stable-centos7'] {
  #     ensure   => present,
  #     enabled  => 1,
  #     priority => 12,
  #     protect  => 1,
  #     require  => [
  #       Package[yum-plugin-priorities],
  #     ],
  #   }
  # }
  # include kekcc::storm::common::repo

  # # error: cannot redeclare
  # yumrepo { 'storm-stable-centos7':
  #   * => {
  #     ensure   => present,
  #     enabled  => 1,
  #     priority => 12,
  #     protect  => 1,
  #     require  => [
  #       Package[yum-plugin-priorities],
  #     ]
  #   }
  # }
}
