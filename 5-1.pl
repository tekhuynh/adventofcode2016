use Digest::MD5 qw(md5 md5_hex md5_base64);

$in = "wtnhxymk";
@list = ();
$i = 0;

while (@list < 8) {
  $h = md5_hex($in.$i);
  if ($h =~ /^00000(.)/) {
    push @list, $1;
    print join '', @list, "\n";
  }
  ++$i;
}

