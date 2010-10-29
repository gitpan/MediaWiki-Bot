
use strict;
use warnings;

BEGIN { require 5.008; }

use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'a MediaWiki bot framework written in Perl',
  'AUTHOR' => 'Dan Collins <en.wp.st47@gmail.com>, Mike.lifeguard <mike.lifeguard@gmail.com>, Alex Rowe <alex.d.rowe@gmail.com>, Oleg Alexandrov <oleg.alexandrov@gmail.com>, jmax.code <jmax.code@gmail.com>, Stefan Petrea <stefan.petrea@gmail.com>, kc2aei <kc2aei@gmail.com>, bosborne@alum.mit.edu, Brian Obio <brianobio@gmail.com>, patch and bug report contributors',
  'BUILD_REQUIRES' => {
    'File::Find' => '0',
    'File::Temp' => '0',
    'Test::More' => '0.88',
    'utf8' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'MediaWiki-Bot',
  'EXE_FILES' => [],
  'LICENSE' => 'gpl',
  'NAME' => 'MediaWiki::Bot',
  'PREREQ_PM' => {
    'Carp' => '0',
    'Crypt::SSLeay' => '0.57',
    'Digest::MD5' => '2.39',
    'Encode' => '0',
    'HTML::Entities' => '3.28',
    'MediaWiki::API' => '0.20',
    'Module::Pluggable' => '0',
    'URI::Escape' => '1.35',
    'XML::Simple' => '2.16'
  },
  'VERSION' => '3.2.6',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



