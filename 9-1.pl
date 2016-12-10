$ans = "";
chomp($line = <>);
while ($line) {
  if ($line =~ s/^(.*?)\((\d+)x(\d+)\)//) {
    $ans .= $1;
    $rpt = substr $line, 0, $2;
    $ans .= $rpt for (1..$3);
    substr $line, 0, $2, "";
  } else {
    $ans .= $line;
    $line = '';
  }

}
print $ans, "\n";
print length $ans, "\n";

