#!./perl
###########################################################################
#
#   Build.PL
#
#   Copyright (C) 2015 Mark Rogaski (mrogaski@cpan.org);
#   all rights reserved.
#
#   See the README file included with the
#   distribution for license information.
#
##########################################################################

use Module::Build;
my $build = Module::Build->new
(
  module_name         => 'Log::Agent::Logger',
  dist_version_from   => 'Logger.pm',
  license             => 'artistic_2',
  requires            => {
		'Getargs::Long' => '0.103',
		'Log::Agent'    => '0.208'
  },
);
$build->create_build_script;
