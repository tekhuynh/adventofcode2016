
$sum = 0;

while (chomp($line = <>)) {
  ($name, $id, $chksum) = $line =~ /^(.+)-(\d+)\[(\w+)\]$/;
  $name =~ s/-//g;
  %chars = ();
  map { $chars{$_}++ } split '', $name;
  $s = join '', sort { $chars{$b} <=> $chars{$a} } sort keys %chars;
  $sum += $id if ($chksum eq substr $s, 0, 5);
}
print $sum, "\n";
