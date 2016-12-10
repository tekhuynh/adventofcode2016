$count = 0;
while (chomp($line = <>)) {
  my $invalid = 0;
  @p = $line =~ /\[(.*?)\]/g;
  for $l (@p) {
    if ($l =~ /(.)(.)\2\1/ and $1 ne $2) {
      $invalid = 1;
    }
  }

  next if $invalid;
  $invalid = 1;
  @f = split /\[.*?\]/, $line;
  for $l (@f) {
    print $l, "\n";
    if ($l =~ /(.)(.)\2\1/ and $1 ne $2) {

      print $l, " ", $line, "\n";
      $invalid = 0;
      last;
    }
  }

  next if $invalid;
  $count++;
}
print $count, "\n";
