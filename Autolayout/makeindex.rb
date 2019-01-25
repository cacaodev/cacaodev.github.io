
def decamelize(str)
    return str if str =~ /^CP.*/

     ret = str.to_s.
       gsub(/([A-Z\d]+)([A-Z][a-z])/, '\1 \2').
       gsub(/([a-z]+)([A-Z\d])/, '\1 \2').
       gsub(/([A-Z]{2,})(\d+)/i, '\1 \2').
       gsub(/(\d+)([a-z])/i, '\1 \2').
       gsub(/(.+?)\&(.+?)/, '\1 & \2').
       gsub(/\s/, ' ')

   return ret
end

out = ""

Dir.glob("*").each do |d|
    if Dir.exists?(d) && d != "Frameworks" && !(d =~ /^NS.*/)
        dirname = File.basename(d)
        out += "<a href=\"#{dirname}\">#{decamelize(dirname)}</a></br>\n"
    end
end

index_html = "
<!DOCTYPE html>
<html>
<head>
<style>
a {
    font-size: 24pt;
    text-decoration: none;
    color: darkblue;
}
a:hover {
    color: fuchsia;
}
</style>
</head>
<body>
<h1>Autolayout Examples</h1>
#{out}
</body>
</html>"

filew = File.new("index.html", "w")
filew.write(index_html)
filew.close
