# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl MediaWiki::Bot.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test::More tests => 3;

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

use strict;
use MediaWiki::Bot;

my $namespace_id = "10";
my $page_limit = 1;

my $wikipedia = MediaWiki::Bot->new;

if(defined($ENV{'PWPMakeTestSetWikiHost'})) {
	$wikipedia->set_wiki($ENV{'PWPMakeTestSetWikiHost'}, $ENV{'PWPMakeTestSetWikiDir'});
}

my @pages = $wikipedia->get_pages_in_namespace($namespace_id);

like( $pages[0], qr/^Template/, "Template namespace found" );

@pages = $wikipedia->get_pages_in_namespace($namespace_id, $page_limit);

is( scalar @pages, $page_limit, "Correct number of pages retrieved" );

$namespace_id = "non-existent";

@pages = $wikipedia->get_pages_in_namespace($namespace_id);

is( scalar @pages, 0, "No pages retrieved" );
