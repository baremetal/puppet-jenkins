Exec { path => ["/bin", "/sbin", "/usr/bin", "/usr/sbin", "/usr/local/bin"], }

class jenkins {
  file { "/var/cache/jenkins-ci.org.asc":
    source => "puppet:///modules/jenkins/var/cache/jenkins-ci.org.asc",
  }

  exec { "add_jenkins_key":
    command => "apt-key add /var/cache/jenkins-ci.org.asc",
    require => File["/var/cache/jenkins-ci.org.asc"],
    unless => "apt-key list | grep D50582E6",
    before => File["/etc/apt/sources.list.d/jenkins-ci.list"],
  }

  file { "/etc/apt/sources.list.d/jenkins-ci.list":
    source => "puppet:///modules/jenkins/etc/apt/sources.list.d/jenkins-ci.list",
    notify => Exec["update_apt"],
  }

  package { "jenkins":
    require => [Exec["add_jenkins_key"], File["/etc/apt/sources.list.d/jenkins-ci.list"]],
  }

  exec { "update_apt":
    command => "apt-get update",
    refreshonly => true,
  }
}

include jenkins
