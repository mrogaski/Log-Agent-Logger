#!./perl
###########################################################################
#
#   Makefile.PL
#
#   Copyright (C) 1999-2000 Raphael Manfredi.
#   Copyright (C) 2015 Mark Rogaski, mrogaski@cpan.org;
#   all rights reserved.
#
#   See the README file included with the
#   distribution for license information.
#
##########################################################################

use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'	=> 'Log::Agent::Logger',
    'VERSION_FROM' => 'Logger.pm', # finds $VERSION
	'PREREQ_PM' => {
		'Getargs::Long'    => '0.103',
		'Log::Agent'       => '0.208',
	},
	'PM' => build_pm_hash(),
    'LIBS'	=> [''],		# e.g., '-lm'
    'DEFINE'	=> '',		# e.g., '-DHAVE_SOMETHING'
    'INC'	=> '',			# e.g., '-I/usr/include/other'
	# 'PREFIX' => '/home/ram/usr/lib/site_perl',
);

#
# build_pm_hash
#
# Find out all the *.pm files in the MANIFEST, and build a hash ref
# containing entries like:
#
#      'file.pm'    =>  '$(INST_LIBDIR)/file.pm'
#
# for each file.
#
sub build_pm_hash {
	local *MANI;
	open(MANI, "MANIFEST") || die "can't open MANIFEST: $!";
	local $_;
	my @pm;
	while (<MANI>) {
		my ($file, $comment) = split;
		next unless $file =~ /\.pm$/;
		push @pm, $file;
	}
	my %pm = map { $_ => '$(INST_LIBDIR)/' . $_ } @pm;
	return \%pm;
}
