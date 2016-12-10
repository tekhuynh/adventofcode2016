use Digest::MD5 qw(md5 md5_hex md5_base64);

$in = "wtnhxymk";
$count = 0;
@list = ();
$i = 0;

while ($count < 8) {
  $h = md5_hex($in.$i);
  if ($h =~ /^00000([0-7])(.)/) {
    if (not defined $list[$1]) {
      $list[$1] = $2;
      print $h, "\n";
      print join '', @list, "\n";
      $count++;
    }
  }
  ++$i;
}

