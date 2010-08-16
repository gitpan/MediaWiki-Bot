
use strict;
use warnings;

BEGIN { require 5.008; }

use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'a MediaWiki bot framework written in Perl',
  'AUTHOR' => 'Dan Collins <en.wp.st47@gmail.com>, Mike.lifeguard <mike.lifeguard@gmail.com>, Alex Rowe <alex.d.rowe@gmail.com>, Oleg Alexandrov <oleg.alexandrov@gmail.com>, jmax.code <jmax.code@gmail.com>, Stefan Petrea <stefan.petrea@gmail.com>, kc2aei <kc2aei@gmail.com>, bosborne@alum.mit.edu, Brian Obio <brianobio@gmail.com>, patch and bug report contributors',
  'BUILD_REQUIRES' => {
    'English' => '0',
    'File::Find' => '0',
    'File::Temp' => '0',
    'Test::Kwalitee' => '0',
    'Test::More' => '0',
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
    'Digest::MD5' => '0',
    'Encode' => '0',
    'HTML::Entities' => '0',
    'MediaWiki::API' => '0',
    'Module::Pluggable' => '0',
    'URI::Escape' => '0',
    'WWW::Mechanize' => '0',
    'XML::Simple' => '0'
  },
  'VERSION' => '3.2.0',
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



