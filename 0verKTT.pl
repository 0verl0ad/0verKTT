
#Tutorial para CPH
#Codeado por The X-C3LL
#http://0verl0ad.blogspot.com


use Net::Twitter;
use LWP::UserAgent;
use JSON;

my $consumer_key = "";
my $consumer_secret = "";
my $token = "";
my $token_secret = "";


$ARGC = @ARGV;
if ($ARGC != 1){
print "\nUso: 0verKTT.pl <url del txt>";
exit(0);
}


print q(
             -===Kidnapping Trending Topics v0.2 Public===-
                            By The X-C3LL
 

 
);

print "[-->] Autenticandonos en Twitter... \n";

my $nt = Net::Twitter->new(
      traits   => [qw/OAuth API::REST/],
      consumer_key        => $consumer_key,
      consumer_secret     => $consumer_secret,
      access_token        => $token,
      access_token_secret => $token_secret,
  );



while(true) {


print "[-->] Conectando con el servidor [" . $ARGV[0] . "]...\n";
$Tweet = &actu($ARGV[0]);
print "[-->] Tweet actual... " . $Tweet . "\n";
print "[-->] Trends Spammed...\n\n";



$TT = &sacarTT;
foreach $trend (@{$TT->[0]->{'trends'}}) {

    $xc = $trend->{'name'};
    print $xc . "\n";
    $spam = $Tweet . " " . $xc;
    $nt->update($spam);
    sleep 45;
  }

}

sub sacarTT {

$nav = LWP::UserAgent->new;
$nav = $nav->get('http://api.twitter.com/1/trends/1.json');
$nav = $nav->decoded_content;
$json_result = from_json($nav);

return $json_result;

}


sub actu {

$nav = LWP::UserAgent->new;
$nav = $nav->get($_[0]);
$nav = $nav->decoded_content;

return $nav;

}
