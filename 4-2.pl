use Data::Dumper;

$sum = 0;

while (chomp($line = <>)) {
  ($name, $id, $chksum) = $line =~ /^(.+)-(\d+)\[(\w+)\]$/;
  $name =~ s/-/ /g;
  $name = lc $name;
  print  map { $_ ne ' ' ? chr(ord('a') + ((ord($_) - ord('a') + $id) % 26)) : ' ' } split '', $name;
  print " $id \n";
}
