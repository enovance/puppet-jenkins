# Class: jenkins::cli
#
# Allow Jenkins commands to be issued from the command line
#
class jenkins::cli {

  $jar = '/usr/lib/jenkins/jenkins-cli.jar'
  $extract_jar = 'jar -xf /usr/lib/jenkins/jenkins.war WEB-INF/jenkins-cli.jar'
  $move_jar = "mv WEB-INF/jenkins-cli.jar $jar"
  $remove_dir = 'rm -rf WEB-INF'

  exec { 'jenkins-cli':
    command => "$extract_jar && $move_jar && $remove_dir",
    path    => ['/bin', '/usr/bin'],
    cwd     => '/root',
    creates => $jar,
    require => Package['jenkins'],
  }

}
