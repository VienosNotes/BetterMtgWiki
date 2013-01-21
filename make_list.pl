use 5.12.0;
use strict;
use warnings;
use utf8;
use Encode;
use Furl;


unless (-f "list.txt") {
    my $furl = Furl->new(agent => "BetterMtgWiki/make_list.pl");
    my $res = $furl->get('http://whisper.wisdom-guild.net/search.php?name=&name_ope=and&mcost=&mcost_op=able&mcost_x=may&ccost_more=0&ccost_less=&color_multi=able&color_ope=or&rarity_ope=or&text=&text_ope=and&oracle=&oracle_ope=and&p_more=&p_less=&t_more=&t_less=&display=cardname&supertype_ope=and&cardtype_ope=and&subtype%5B%5D=&subtype_ope=and&format=standard&set_ope=or&illus%5B%5D=&illus_ope=or&flavor=&flavor_ope=and&sort=name_en&sort_op=&output=text');
    open my $fh, ">", "list.txt";
    $fh->print($res->content);
    close $fh;
}

open my $fh, "<:encoding(Shift_JIS)", "list.txt";

if (-d "output") {

}


my @name;
for (<$fh>) {
    if (m/英語名：(.*)/) {
        my $ok = $1;
#        $ok =~ s/\s/\\s/;
        push(@name, '"' . $ok . '"')
    }
}
close $fh;

open my $output, ">", "templates/js/standards.js";
$output->print("var standards = [\n\t");
$output->print(join ",\n\t", @name);
$output->print("\n];\n");
close $output;

